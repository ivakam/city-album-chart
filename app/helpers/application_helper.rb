module ApplicationHelper
	
	def fetch_user
		if session[:user_id]
			user = User.find_by(id: session[:user_id])
			return user
		else
			return nil
		end
	end
	
	def user_upvotes(user = User.find_by(id: session[:user_id]))
		return Upvote.where(user: user).size
	end
	
	def user_karma(user = User.find_by(id: session[:user_id]))
		return Upvote.where(post: Post.where(user: user)).size
	end
	
	def post_upvotes(post)
		return Upvote.where(post: post).size
	end
	
	def auth
		@user = fetch_user
		userAuth = {}
		userAuth['logged_in'] = false
		userAuth['admin'] = false
		userAuth['power_user'] = false
		p @user
		if @user != nil 
			userAuth['logged_in'] = true
			if @user.admin == true
				userAuth['admin'] = true
			end
			if @user.karma >= 50
				userAuth['power_user'] = true
			end
		end
		return userAuth.to_json.html_safe
	end
	
	def inject_login
		if session[:user_id]
			render 'partials/logout' 
		else
			render 'partials/login'
		end
	end
	
	def album_count
		return Album.all.size
	end
end
