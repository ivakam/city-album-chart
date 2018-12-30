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
        userAuth = {}
        if session[:user_id].to_s == params[:id]
            userAuth['logged_in'] = true
            userAuth['admin'] = false
            userAuth['power_user'] = false
            user = User.find_by(id: params[:id])
            if user.admin == true
                userAuth['admin'] = true
            end
            p user.karma
            if user.karma >= 50
                userAuth['power_user'] = true
            end
            return render :json => userAuth
        end
        render :json => ''
    end
end
