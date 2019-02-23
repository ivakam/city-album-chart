require 'json'

class ArticlesController < ApplicationController
    def show
        @articles = Article.where(category: params[:category]).order(:created_at)
        @featured = Article.where(featured: true).order('RAND()').first
        @articles ||= Article.all.order(:created_at).reverse_order.limit(20)
    end
    
    def show_article
        @article = Article.find_by(id: params[:article_id])
        render 'show_article'
    end
    
    def new
    	if get_user
    	    @article = Article.new()
    		render 'new'
    	else
    		login_barrier
    	end
    end
    
    def create
        if get_user
            @article = Article.new(article_params)
            if !get_user.admin
                @article.featured = false
            end
            @article.user = get_user
            if !@article.save
                redirect_to request.referrer, notice: @article.errors[:base][0]
                return
            end
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
        if params[:article][:serialized_ids].present? && get_user.admin
            article_ids = JSON.parse(params[:article][:serialized_ids])
            article_ids.each do | a |
                article = Article.find_by(id: a)
                article.destroy
            end
        else
            @article = Article.find_by(id: params[:article][:article_id])
            if get_user == @article.user || get_user.admin
                @article.destroy
                redirect_to root_url + 'articles' 
            else
                on_access_denied
            end
        end
    end
    
    def toggle_featured
        if get_user && get_user.admin
            @article = Article.find_by(id: params[:article][:article_id])
            if !@article.featured
                @article.featured = true
            else
                @article.featured = false
            end
            @article.save
        else
            on_access_denied
        end
    end
    
    private
    
    def article_params
        params.require(:article).permit(:body, :title, :subtitle, :category, :banner, :featured)
    end
end