class UserMailer < ApplicationMailer
    default from: 'noreply@superkayo.com'

    def email_confirmation
        logger.debug "-------------------------------------------> sending email"
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Email Confirmation")
    end
end
