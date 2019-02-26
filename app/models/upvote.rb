class Upvote < ApplicationRecord
    belongs_to :user
    
    after_create do
        update_with_user_status_service
    end
    
    private
    
    def update_with_user_status_service
        UserStatusService.new({
            upvote: self
        }).update
    end
end