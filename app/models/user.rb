class User < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one_attached :avatar
	has_many :forum_threads
	has_many :posts
	has_many :articles
	has_many :comments
	has_many :albums
	has_many :upvotes, :dependent => :destroy

    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    has_secure_password 
    validates :password, presence: true, length: { minimum: 8 }
end
