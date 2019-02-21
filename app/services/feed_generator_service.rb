class FeedGeneratorService
    def initialize(offset)
        @offset = offset 
    end
    
    def generate
        @posts = Post.all.order('created_at desc').offset(@offset).limit(10)
        @albums  = Album.all.order('created_at desc').offset(@offset).limit(5)
        @announcements = Announcement.all.order('created_at desc').limit(5)
        return { :posts => @posts, :albums => @albums, :announcements => @announcements }
    end
end