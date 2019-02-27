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
		coverPath = Rails.root.join("app/assets/images/missingcover.jpg")
		if !cover.attached?
			cover.attach(io: File.open(coverPath), filename: 'missingcover.jpg')
		else
			if cover.blob.byte_size > 1000000
				errors[:base] << 'Album cover too large! Max filesize 1MB'
			elsif !cover.blob.content_type.starts_with?('image/')
				errors[:base] << 'Wrong format'
			end
		end
	end
end
