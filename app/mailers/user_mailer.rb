class UserMailer < ApplicationMailer
    default from: 'noreply@superkayo.com'

     def email_confirmation
        logger.debug "-------------------------------------------> sending email"
        @user = params[:user]
        mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Email Confirmation")
     end

	def confirm_email
    	user = User.find_by_confirm_token(params[:id])
    	if user
      		user.email_activate
      		redirect_to '/'
    	else
      		redirect_to '/'
    	end
	end
end
