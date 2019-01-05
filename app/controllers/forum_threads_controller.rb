class ForumThreadsController < ApplicationController
    def show
        @thread = ForumThread.find_by(id: params[:thread_id])
        @posts = @thread.posts
        @page = params[:p].to_i
        @page = 1 if @page == 0
        @page_posts = @posts.limit(10).offset((@page - 1) * 10)
        render 'show'
    end
    
    private
    
    def forum_params
        params.permit(:thread_id, :p)
    end
end