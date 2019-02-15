class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_one_attached :banner
    validate :banner_validation
    
    after_save do
        update_with_user_status_service
    end
    
    private
    
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