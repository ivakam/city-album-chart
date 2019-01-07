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
		begin
			if User.find(session[:user_id]).admin
				toBeNuked = JSON.parse(params[:thread][:serialized_ids])
				toBeNuked.each do | thread |
					@thread = ForumThread.find_by(id: thread)
					@thread.destroy
				end
				return
			end
			rescueHandler('401', true)
		rescue StandardError => e
			rescueHandler('401', true, e)
		end
    end
    
    private
    
    def forum_params
        params.permit(:thread_id, :p, :thread)
    end
end