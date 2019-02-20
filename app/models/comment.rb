class Comment < ApplicationRecord
    belongs_to :user, :touch => true
    belongs_to :article, :touch => true
    
    after_save do
        update_with_user_status_service
        update_with_notification_generator_service
    end
    
    private
    
    def update_with_notification_generator_service
        NotificationGeneratorService.new({
            model: self.article,
            child: self
        }).generate_notifications
    end
    
    def update_with_user_status_service
        UserStatusService.new({
            user: self.user
        }).update
    end
end