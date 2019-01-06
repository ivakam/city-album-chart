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
    
    private
    
    def forum_params
        params.permit(:thread_id, :p, :thread)
    end
end