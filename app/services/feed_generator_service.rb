class FeedGeneratorService
    def initialize(offset = 0)
        @offset = offset 
    end
    
    def generate
        @activity = Post.all.order('created_at desc').offset(@offset).limit(25 + @offset) + Article.all.order('created_at desc').offset(@offset).limit(25 + @offset)
        @albums = Album.all.order('created_at desc').limit(5)
        @announcements = Announcement.all.order('created_at desc').limit(5)
        @activity = @activity.sort_by{ |m| m.created_at }.reverse!
        @activity = @activity.slice(0, 25)
        return { :activity => @activity, :albums => @albums, :announcements => @announcements }
    end
end