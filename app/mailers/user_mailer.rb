class UserMailer < ApplicationMailer
    default from: 'noreply@superkayo.xyz'

     def email_confirmation
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Email Confirmation")
     end
end
