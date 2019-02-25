class ForumThread < ApplicationRecord
    before_destroy :clean_with_association_cleanup_service
    
    has_many :posts, dependent: :destroy
    belongs_to :user
    
    after_save do
        subscribe_with_auto_subscribe_service
    end
    
    private
    
    def clean_with_association_cleanup_service
        AssociationCleanupService.new({
            model: self,
            children: self.posts
        }).clean
    end
    
    def subscribe_with_auto_subscribe_service
        AutoSubscriptionService.new({
            model: self
        }).auto_subscribe
    end
end