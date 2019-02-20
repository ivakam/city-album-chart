class Post < ApplicationRecord
    belongs_to :forum_thread, :touch => true
    belongs_to :user, :touch => true
    
    after_save do
        update_with_user_status_service
        update_with_notification_generator_service
    end
    
    private
    
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