require 'nokogiri'

module ForumThreadsHelper
    def get_badges(user)
        return user.badges.split(/\s+/)
    end
    
    def get_body(post)
        return post.body.gsub(/\n/, '<br/>').html_safe
    end
end