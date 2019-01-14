class HomeController < ApplicationController
    def show
        @content = generate_feed(0)
        p @content
    end
    
    def fetch
        @content = generate_feed
        p @content
    end
    
    private
    
    def generate_feed(offset)
        return FeedGeneratorService.new(offset).generate
    end
end