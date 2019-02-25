require 'mini_magick'
require 'redcarpet'

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
	
	def bg_variant(image)
		path = Rails.root.join('app/assets/images/bg/')
		p path
		image_name = image
		image = MiniMagick::Image.open(File.join(path, image))
		image.combine_options do | b |
			b.crop '1:1'
			b.resize '600x600'
			b.gravity 'center'
		end
		image.write(File.join(path, '/tmp/', image_name))
		return 'https://i.imgur.com/ceYNiDi.png'
	end
	
	def user_upvotes(user = User.find_by(id: session[:user_id]))
		return Upvote.where(user: user).size
	end
	
	def post_upvotes(postIn)
		return Upvote.where(upvote_type: 'post', target_id: postIn.id).size
	end
	
	def article_upvotes(article)
		return Upvote.where(upvote_type: 'article', target_id: article.id).size
	end
	
	def comment_upvotes(comment)
		return Upvote.where(upvote_type: 'comment', target_id: comment.id).size
	end
	
	def user_karma(user = User.find_by(id: session[:user_id]))
		karma = 0
		user.posts.each do | post |
			p 'posts'
			karma += post_upvotes(post)
		end
		user.articles.each do | a |
			karma += article_upvotes(a)
		end
		user.comments.each do | c |
			karma += comment_upvotes(c)
		end
		p karma
		return karma
	end
	
	def inject_login
		if fetch_user
			render 'partials/logout' 
		else
			render 'partials/login'
		end
	end
	
	def album_count
		return Album.all.size
	end
	
	def parse_markdown(text = '', preview = false)
		renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
		if preview
			renderer = Redcarpet::Render::HTML.new(no_links: true, no_images: true, filter_html: true)
		end
		markdown = Redcarpet::Markdown.new(renderer, autolink: true)
		return markdown.render(text).html_safe
	end
end
