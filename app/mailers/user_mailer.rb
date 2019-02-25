class UserMailer < ApplicationMailer
    default from: 'staff@superkayo.xyz'

    def email_confirmation
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Email Confirmation")
    end

    def password_reset
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Password Reset")
    end
end
