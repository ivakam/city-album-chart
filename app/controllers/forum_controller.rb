class ForumController < ApplicationController
    def show
    end
    
    def show_board
        @category = params[:category]
        @title = @category.titleize
        @stickies = ForumThread.where(category: @category, stickied: true)
        p ForumThread.all
        p @stickies
        render 'board'
    end
end