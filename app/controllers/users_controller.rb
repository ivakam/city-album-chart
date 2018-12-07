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
        @user.save
        # Automatically log in after account is created
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/panel'
        else
          render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end
