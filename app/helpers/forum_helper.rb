module ForumHelper
    def board_last_updated(board)
        if ForumThread.find_by(category: board).present?
            return ForumThread.where(category: board).order('updated_at desc').first
        else
            return DummyThread.new()
        end
    end
    
    private
    
    class DummyThread
        def title
            'No threads in board'
        end
        def updated_at
            DateTime.new(2001,2,3,4,5,6)
        end
    end
end