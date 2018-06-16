class Album < ApplicationRecord
	has_many :tracks, dependent: :destroy
	mount_uploader :image, ImageUploader
	validate :form_presence
	validates_processing_of :image
	validate :image_size_validation
	 
	private
		def image_size_validation
			errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
		end
	def form_presence
		if scraper.blank?
			if (title.blank? || romaji_artist.blank?)
		  		errors.add(:base, "All required fields must be filled out.")
		  	end
		end
	end
end
