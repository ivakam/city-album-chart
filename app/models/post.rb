class Post < ApplicationRecord
    belongs_to :forum_thread, :touch => true
    belongs_to :user, :touch => true
    before_destroy :clean_with_association_cleanup_service
    
    after_create do
        update_with_user_status_service
        update_with_notification_generator_service
    end
    
    private
    
    def clean_with_association_cleanup_service
        AssociationCleanupService.new({
            model: self
        }).clean
    end
    
    def update_with_notification_generator_service
        NotificationGeneratorService.new({
            model: self.forum_thread,
            child: self
        }).generate_notifications
    end
    
    def update_with_user_status_service
        UserStatusService.new({
            user: self.user
        }).update
    end
end