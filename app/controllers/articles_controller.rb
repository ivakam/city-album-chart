class ArticlesController < ApplicationController
    def show
        @featured = Article.find_by(featured: true)
    end
end