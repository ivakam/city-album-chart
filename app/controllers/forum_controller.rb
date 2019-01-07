class ForumController < ApplicationController
    def show
    end
    
    def show_board
        @category = params[:category]
        @title = @category.titleize
        @threads = ForumThread.where(category: @category, stickied: false).order(:created_at).reverse_order
        @stickies = ForumThread.where(category: @category, stickied: true).order(:created_at)
        @page = params[:p].to_i
        @page = 1 if @page == 0
        @page_threads = @threads.limit(10).offset((@page - 1) * 10)
        render 'board'
    end
    
    private
    
    def forum_params
        params.permit(:p, :category)
    end
end