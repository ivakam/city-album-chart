class Comment < ApplicationRecord
    belongs_to :user, :touch => true
    belongs_to :article, :touch => true
    
    after_save do
        update_with_user_status_service
    end
    
    private
    
    def update_with_user_status_service
        UserStatusService.new({
            user: self.user
        }).update
    end
end