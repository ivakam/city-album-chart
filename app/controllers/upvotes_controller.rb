class UpvotesController < ApplicationController
    
    def destroy
        @upvote.destroy
    end
    
    def create
        if get_user
            @upvote ||= Upvote.find_by(user: get_user, post: params[:upvote][:post_id])
            @upvote ||= Upvote.find_by(user: get_user, article: params[:upvote][:article_id])
            @upvote ||= Upvote.find_by(user: get_user, comment: params[:upvote][:comment_id])
            if @upvote.present?
                return destroy
            end
            @upvote = Upvote.new()
            @upvote.user = get_user
            @upvote.post = Post.find_by(id: params[:upvote][:post_id])
            @upvote.article = Article.find_by(id: params[:upvote][:article_id])
            @upvote.comment = Comment.find_by(id: params[:upvote][:comment_id])
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