class UsersController < ApplicationController
    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to '/login'
        end
    end

    def new
    end

    def create
    end
end
