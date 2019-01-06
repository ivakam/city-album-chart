module ForumHelper
    def board_last_updated(board)
        return ForumThread.where(category: board).order('updated_at desc').first
    end
end