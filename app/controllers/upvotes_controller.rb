class UpvotesController < ApplicationController
    
    def destroy
        @upvote.destroy
    end
    
    def create
        if get_user
            @upvote = Upvote.find_by(user: get_user, post: params[:upvote][:post_id])
            if @upvote.present?
                return destroy
            end
            @upvote = Upvote.new()
            @upvote.user = get_user
            @upvote.post = Post.find_by(id: params[:upvote][:post_id])
            @upvote.save
        else
            login_barrier
        end
    end
    
    private
    
    def upvote_params
        params.require(:upvote).permit(:post_id, :user_id)
    end
end