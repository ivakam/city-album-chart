class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password]) 
            session[:user_id] = user.id
            if user.email_confirmed
                redirect_to request.referrer
            else
                #UserMailer.with(user: @user).email_confirmation.deliver_now
                redirect_to request.referrer, notice: 'Please confirm your email'
            end
        else
            redirect_to request.referrer, notice: 'Incorrect username or password'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_url
    end
    
end
