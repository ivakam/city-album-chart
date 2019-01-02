class Album < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_many :tracks, dependent: :destroy
	has_one_attached :cover
	validate :form_presence
	validate :cover_validation
	 
	private
		def cover_validation
			if cover.attached?
				if cover.blob.byte_size > 500000
					cover.purge
					errors[:base] << "Filesize too large"
				elsif !cover.blob.content_type.starts_with?('image/')
					logo.purge
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
