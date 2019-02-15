class ArticlesController < ApplicationController
    def show
        @articles = Article.where(category: params[:category]).order(:created_at)
        @featured = Article.find_by(featured: true)
        @articles ||= Article.all.order(:created_at)
    end
    
    def show_article
        @article = Article.find_by(id: params[:article_id])
        render 'show_article'
    end
    
    def new
        @article = Article.new()
    end
    
    def create
        if get_user
            @article = Article.new(article_params)
            @article.user = get_user
            @article.save
            redirect_to articles_path + '/' + @article.id.to_s
        else
            on_access_denied
        end
    end
    
    def update
        @article = Article.find_by(id: params[:article][:article_id])
        if get_user == @article.user
            @article.body = params[:article][:body]
            @article.save
        else
            on_access_denied
        end
    end
    
    def destroy
        @article = Article.find_by(id: params[:article][:article_id])
        if get_user == @article.user || get_user.admin
            @article.destroy
            redirect_to root_url + 'articles' 
        else
            on_access_denied
        end
    end
    
    private
    
    def article_params
        params.require(:article).permit(:body, :title, :subtitle, :category, :banner)
    end
end