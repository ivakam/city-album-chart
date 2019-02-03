class ArticlesController < ApplicationController
    def show
        @articles = Article.where(category: params[:category]).order(:created_at)
        @featured = Article.find_by(featured: true)
        @articles ||= Article.all.order(:created_at)
    end
    
    def show_article
        p params
        @article = Article.find_by(id: params[:article_id])
        render 'show_article'
    end
    
    private
    
    def article_params
        params.permit(:category, :article)
    end
end