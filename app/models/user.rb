class User < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one_attached :avatar

    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    has_secure_password 
    validates :password, presence: true, length: { minimum: 8 }
end
