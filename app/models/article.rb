class Article < ApplicationRecord
    
    before_destroy :clean_with_association_cleanup_service
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_one_attached :banner
    validate :banner_validation
    
    after_create do
        update_with_user_status_service
        subscribe_with_auto_subscribe_service
    end
    
    private
    
    def clean_with_association_cleanup_service
        AssociationCleanupService.new({
            model: self,
            children: self.comments
        }).clean
    end
    
    def subscribe_with_auto_subscribe_service
        AutoSubscriptionService.new({
            model: self
        }).auto_subscribe
    end
    
    def update_with_user_status_service
        UserStatusService.new({
            user: self.user
        }).update
    end
    
	def banner_validation
	    bannerPath = Rails.root.join("app/assets/images/bg/busy-street.jpg")
        if !banner.attached?
            banner.attach(io: File.open(bannerPath), filename: 'busy-street.jpg')
		else
			if banner.blob.byte_size > 2000000
				banner.purge
				errors[:base] << "Banner too large! Max filesize 2MB"
			elsif !banner.blob.content_type.starts_with?('image/')
				banner.purge
				errors[:base] << 'Wrong format'
			end
		end
	end
end