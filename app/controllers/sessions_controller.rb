class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to request.referrer
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to request.referrer
    end
    
    def auth
        @user = helpers.fetch_user
        userAuth = {}
        userAuth['logged_in'] = false
        userAuth['admin'] = false
        userAuth['power_user'] = false
        if @user != nil 
            if @user.id.to_s == params[:id]
                userAuth['logged_in'] = true
                if @user.admin == true
                    userAuth['admin'] = true
                end
                if @user.karma >= 50
                    userAuth['power_user'] = true
                end
            end
        end
        render :json => userAuth
    end
end
