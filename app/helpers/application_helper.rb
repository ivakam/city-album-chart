module ApplicationHelper
	
	def fetch_user
		if session[:user_id]
			user = User.find_by(id: session[:user_id])
			return user
		else
			return nil
		end
	end
	
	def user_avatar(user)
		if user.avatar.attached?
			return user.avatar.variant(combine_options: { crop: "1:1", resize: "200x200", gravity: "center" }).processed.service_url
		else
			return "https://i.imgur.com/ceYNiDi.png"
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
