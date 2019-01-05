class Post < ApplicationRecord
    belongs_to :forum_thread
    belongs_to :user
    has_many :upvotes
end