module ApplicationHelper
  #Expand this with params and more checks as needed for checking different flags in js.erb
  def user_id
    if session[:user_id]
      return session[:user_id]
    else
      return ''
    end
  end
  
  def inject_login
    if session[:user_id]
      render 'partials/logout' 
    else
      render 'partials/login'
    end
  end
  
  def load_javascript
    if session[:user_id]
      javascript_include_tag 'application', 'about_logged_in', 'albums_logged_in', 'cable_logged_in', 'show_logged_in', 'submit_logged_in', 'data-turbolinks-track': 'reload'
    else
      javascript_include_tag 'application', 'about', 'albums', 'cable', 'show', 'submit', 'data-turbolinks-track': 'reload'
    end
  end
end
