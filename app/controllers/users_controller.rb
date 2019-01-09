require 'json'

class UsersController < ApplicationController
    def show
        @user = User.find_by(username: params[:username])
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
        @user.save
        # Automatically log in after account is created
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to request.referrer
        end
    end
    
    def destroy
        if get_user && get_user.admin
            JSON.parse(params[:serialized_ids]).each do | user_id |
                @user = User.find_by(id: id)
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
    
    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :admin, :banned, :karma, :gender, :birth_year, :location, :bio, :serialized_ids)
    end
end
