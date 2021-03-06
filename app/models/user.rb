class User < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one_attached :avatar
	has_many :forum_threads
	has_many :posts
	has_many :articles
	has_many :comments
	has_many :albums
	has_many :notifications, :dependent => :destroy
	has_many :subscriptions, :dependent => :destroy
	has_many :upvotes, :dependent => :destroy
	has_many :announcements

    before_create :confirmation_token
    before_create :create_reset_password_token
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    validate :avatar_validation
    has_secure_password 
    validates :password, presence: true, length: { minimum: 8 }
	
    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

	private
	
    def confirmation_token
      	if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

    def create_reset_password_token
        self.reset_password_token = SecureRandom.urlsafe_base64.to_s
        self.password_token_expired = true
    end
    
	def avatar_validation
        if avatar.attached?
            if avatar.blob.byte_size > 1000000
                avatar.purge
                errors[:base] << 'Avatar too large! Max filesize 1MB'
            elsif !avatar.blob.content_type.starts_with?('image/')
                avatar.purge
                errors[:base] << 'Wrong format'
            end
        end
	end
end
