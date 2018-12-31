require 'json'

class UsersController < ApplicationController
    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to '/login'
        end
    end

    def new
        if session[:user_id]
          redirect_to "/panel"
        end
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.karma = 0
        @user.banned = false
        @user.admin = false
        @user.save
        # Automatically log in after account is created
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to request.referrer
        end
    end
    
    def destroy
        begin
            if User.find_by(id: session[:user_id]).admin
                JSON.parse(params[:serialized_ids]).each do | user_id |
                    @user = User.find_by(id: id)
                    @user.destroy
                end
                return
            end
            rescueHandler('authorize_error')
        rescue StandardError => e
            rescueHandler('authorize_error', e)
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
            rescueHandler('authorize_error')
        rescue StandardError => e
            rescueHandler('authorize_error', e)
        end
    end
    
    def toggle_ban
        begin
            if User.find_by(id: session[:user_id]).admin
                JSON.parse(params[:user][:serialized_ids]).each do | user_id |
                    @user = User.find_by(id: user_id)
                    if @user.banned
                        @user.update_attribute(:banned, false)
                    else
                        @user.update_attribute(:banned, true)
                    end
                end
                return
            end
            rescueHandler('authorize_error')
        rescue StandardError => e
            rescueHandler('authorize_error', e)
        end
    end

    def panel
        begin
            if User.find_by(id: session[:user_id]).admin
               return render 'panel'
            end
            rescueHandler('authorize_error')
        rescue StandardError => e
            rescueHandler('authorize_error', e)
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
