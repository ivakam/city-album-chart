module ForumThreadsHelper
    def get_badges(user)
        return user.badges.split(/\s+/)
    end
end