class Article < ApplicationRecord
    belongs_to :user, :touch => true
    has_many :comments, :dependent => :destroy
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