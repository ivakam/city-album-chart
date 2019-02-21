class Album < ApplicationRecord
	include Rails.application.routes.url_helpers
	has_many :tracks, dependent: :destroy
	has_one_attached :cover
	validate :cover_validation
	before_destroy :clean_with_association_cleanup_service
	
    after_save do
        update_with_user_status_service
    end
    
    private
    
    def clean_with_association_cleanup_service
        AssociationCleanupService.new({
            model: self
        }).clean
    end
    
    def update_with_user_status_service
        UserStatusService.new({
            user: User.find_by(id: self.user_id)
        }).update
    end
	 
	def cover_validation
		if cover.attached?
			if cover.blob.byte_size > 5000000
				cover.purge
				errors[:base] << "Filesize too large"
			elsif !cover.blob.content_type.starts_with?('image/')
				banner.purge
				errors[:base] << 'Wrong format'
			end
		end
	end
end
