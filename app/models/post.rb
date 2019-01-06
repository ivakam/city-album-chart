class Post < ApplicationRecord
    belongs_to :forum_thread, :touch => true
    belongs_to :user
    has_many :upvotes, :dependent => :destroy
end