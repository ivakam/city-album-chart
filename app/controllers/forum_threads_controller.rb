class ForumThreadsController < ApplicationController
    def show
        @thread = ForumThread.find_by(id: params[:thread_id])
        @posts = @thread.posts.order(:created_at)
        @page = params[:p].to_i
        @page = 1 if @page == 0
        @page_posts = @posts.limit(10).offset((@page - 1) * 10)
        render 'show'
    end
    
    def destroy
		if get_user.admin
			toBeNuked = JSON.parse(params[:thread][:serialized_ids])
			toBeNuked.each do | thread |
				@thread = ForumThread.find_by(id: thread)
				@thread.destroy
			end
		else
			on_access_denied
		end
    end
    
    def new
    	if get_user
    		render 'new'
    	else
    		login_barrier
    	end
    end
    
    def create
		if get_user
			@thread = ForumThread.new()
			@thread.title = params[:thread][:title]
			@thread.user = get_user
			@thread.category = params[:thread][:category]
			p params[:thread][:pinned]
			@thread.stickied = params[:thread][:pinned] === 'true' ? true : false
			@thread.archived = false
			@thread.locked = false
			@post = Post.new()
			@post.user = get_user
			@post.forum_thread = @thread
			@post.body = params[:thread][:body]
			@thread.save
			@post.save
			redirect_to forum_path + "/#{@thread.category}/t/#{@thread.id}"
		else
			on_access_denied
		end
    end
    
    def toggle_pinned
        if get_user && get_user.admin
            @thread = ForumThread.find_by(id: params[:thread][:thread_id])
            if !@thread.stickied
                @thread.stickied = true
            else
                @thread.stickied = false
            end
            @thread.save
        else
            on_access_denied
        end
    end
    
    private
    
    def forum_params
        params.permit(:thread_id, :p, :thread)
    end
end