class HomeController < ApplicationController
    def show
        @content = generate_feed(0)
        @content
    end
    
    def fetch
        @content = generate_feed
        @content
    end
    
    private
    
    def generate_feed(offset)
        return FeedGeneratorService.new(offset).generate
    end
end