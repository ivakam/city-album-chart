class CommentsController < ApplicationController
    def create
        if get_user
            @comment = Comment.new()
            @comment.body = params[:comment][:body]
            @comment.user = get_user
            @comment.article = Article.find_by(id: params[:comment][:article_id])
            @comment.pinned = false
            @comment.save
            redirect_to request.referrer
        else
            on_access_denied
        end
    end
    
    def destroy
        @comment = Comment.find_by(id: params[:comment][:comment_id])
        if get_user == @comment.user || get_user.admin
            @comment.destroy
        else
            on_access_denied
        end
    end
    
    private
    
    def comment_params
        params.require(:comment)
    end
end