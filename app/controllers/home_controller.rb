class HomeController < ApplicationController
    def show
        @content = generate_feed
    end
    
    def fetch
        @content = generate_feed
    end
    
    private
    
    def generate_feed(offset = 0)
        return FeedGeneratorService.new(offset).generate
    end
end