class UserMailer < ApplicationMailer
    default from: 'staff@superkayo.xyz'

    def email_confirmation
        logger.debug "-------------------------------------------> sending email"
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Email Confirmation")
    end
end
