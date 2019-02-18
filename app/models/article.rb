class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_one_attached :banner
    validate :banner_validation
    
    after_save do
        update_with_user_status_service
        subscribe_with_auto_subscribe_service
    end
    
    after_touch do
        update_with_notification_generator_service
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
    
    def update_with_user_status_service
        UserStatusService.new({
            user: self.user
        }).update
    end
    
	def banner_validation
		if banner.attached?
			if banner.blob.byte_size > 5000000
				banner.purge
				errors[:base] << "Filesize too large"
			elsif !banner.blob.content_type.starts_with?('image/')
				banner.purge
				errors[:base] << 'Wrong format'
			end
		end
	end
end