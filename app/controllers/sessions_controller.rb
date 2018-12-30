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
    
end
