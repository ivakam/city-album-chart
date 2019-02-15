class Album < ApplicationRecord
	include Rails.application.routes.url_helpers
	has_many :tracks, dependent: :destroy
	has_one_attached :cover
	validate :form_presence
	validate :cover_validation
	
    after_save do
        update_with_user_status_service
    end
    
    private
    
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
	
	def form_presence
		if scraper.blank?
			if (title.blank? || romaji_artist.blank?)
		  		errors.add(:base, "All required fields must be filled out.")
		  	end
		end
	end
end
