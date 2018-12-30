module ApplicationHelper
  #Expand this with params and more checks as needed for checking different flags in js.erb
  def fetch_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      return @user
    else
      return nil
    end
  end
  
  def inject_login
    if session[:user_id]
      render 'partials/logout' 
    else
      render 'partials/login'
    end
  end
  
end
