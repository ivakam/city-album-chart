class Upvote < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true
    belongs_to :article, optional: true
    belongs_to :comment, optional: true
    
    after_save do
        update_with_user_status_service
    end
    
    private
    
    def update_with_user_status_service
        UserStatusService.new({
            upvote: self
        }).update
    end
end