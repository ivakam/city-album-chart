class ForumThread < ApplicationRecord
    has_many :posts, dependent: :destroy
    belongs_to :user
    
    after_touch do
        update_with_notification_generator_service
    end
    
    after_save do
        subscribe_with_auto_subscribe_service
    end
    
    private
    
    def subscribe_with_auto_subscribe_service
        AutoSubscriptionService.new({
            model: self
        }).auto_subscribe
    end
    
    def update_with_notification_generator_service
        NotificationGeneratorService.new({
            model: self
        }).generate_notifications
    end
end