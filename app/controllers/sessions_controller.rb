class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
<<<<<<< HEAD
        if user && user.authenticate(params[:session][:password]) 
            #if user.email_confirmed
                session[:user_id] = user.id
                redirect_to request.referrer
            #else
                redirect_to request.referrer, notice: 'Please confirm your email'
            #end
=======
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to request.referrer
>>>>>>> parent of 74a9058... add mailer for users\n- sending, but needs configuration
        else
            redirect_to request.referrer, notice: 'Incorrect username or password'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_url
    end
    
end
