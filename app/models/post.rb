class Post < ApplicationRecord
    belongs_to :forum_thread, :touch => true
    belongs_to :user, :touch => true
    has_many :upvotes, :dependent => :destroy
    
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