require 'json'

class UsersController < ApplicationController
    def show
        @user = User.find_by(username: params[:username])
        @activity = Article.where(user: @user) + Post.where(user: @user) + ForumThread.where(user: @user) + Comment.where(user: @user)
        @activity = @activity.sort_by { |m| m.created_at }
        @activity = @activity.slice(0, 25)
        if @user == get_user
            @notifications = Notification.where(user: get_user).order('created_at').reverse_order.limit(25)
        end
        if @user == nil
            render_404
        end
    end
    
    def update
        @user = User.find_by(id: params[:user][:id])
        if get_user == @user
            p params[:user][:avatar].present?
            if params[:user][:avatar].present?
                @user.avatar.attach(params[:user][:avatar])
                redirect_to request.referrer, notice: 'Avatar successfully updated!'
            else
                @user.update_attribute('birth_year', params[:user][:birth_year])
                @user.update_attribute('gender', params[:user][:gender])
                @user.update_attribute('location', params[:user][:location])
                @user.update_attribute('bio', params[:user][:bio])
                redirect_to request.referrer, notice: 'Account info successfull updated!'
            end
        else
            on_access_denied
        end
    end
    
    def create
        @user = User.new(user_params)
        @user.banned = false
        @user.admin = false
        @user.badges = ''
        @user.account_type = 'Member'
        if @user.valid?
            @user.save
            UserMailer.with(user: @user).email_confirmation.deliver_later
            # Automatically log in after account is created
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to request.referrer
            end
        else
            if User.exists?(:username => @user.username)
                redirect_to request.referrer, notice: 'Username already exists'
            end
            if User.exists?(:email => @user.email)
                redirect_to request.referrer, notice: 'User with the provided email already exists'
            end
        end
    end
    
    def destroy
        if get_user && get_user.admin
            JSON.parse(params[:user][:serialized_ids]).each do | user_id |
                @user = User.find_by(id: user_id)
                dummy = User.find(1)
                @user.forum_threads.each do | t |
                    t.user = dummy
                    t.save
                end
                @user.posts.each do | t |
                    t.user = dummy
                    t.save
                end
                @user.albums.each do | t |
                    t.user_id = dummy.id
                    t.save
                end
                @user.articles.each do | t |
                    t.user = dummy
                    t.save
                end
                @user.comments.each do | t |
                    t.user = dummy
                    t.save
                end
                @user.destroy
            end
        else
            on_access_denied
        end
    end
    
    def toggle_admin
        begin
            if User.find_by(id: session[:user_id]).admin
                JSON.parse(params[:user][:serialized_ids]).each do | user_id |
                    @user = User.find_by(id: user_id)
                    if @user.admin
                        @user.update_attribute(:admin, false)
                    else
                        @user.update_attribute(:admin, true)
                    end
                end
                return
            end
            rescueHandler('401', true)
        rescue StandardError => e
            rescueHandler('401', true, e)
        end
    end
    
    def toggle_ban
        if get_user && get_user.admin
            JSON.parse(params[:user][:serialized_ids]).each do | user_id |
                @user = User.find_by(id: user_id)
                if @user.banned
                    @user.update_attribute(:banned, false)
                else
                    @user.update_attribute(:banned, true)
                end
            end
        else
            on_access_denied
        end
    end

    def panel
        if get_user && get_user.admin
           return render 'panel'
        else
            on_access_denied
        end
    end

    def make_admin
        @user = User.find_by(id: session[:user_id])
        @user.update_attribute(:admin, true)
    end
    
    def nuke_admin
        User.find_by(id: session[:user_id])
        @user.update_attribute(:admin, false)
    end

    def resend_confirmation_email
      UserMailer.with(user: get_user).email_confirmation.deliver_later
      redirect_to request.referrer, notice: "The email has been sent"
    end

	def confirm_email
    	user = User.find_by_confirm_token(params[:id])
    	if user
      		user.email_activate
      		redirect_to '/'
    	else
      		redirect_to '/'
    	end
	end
    
    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :admin, :banned, :karma, :gender, :birth_year, :location, :bio, :serialized_ids)
    end
end
