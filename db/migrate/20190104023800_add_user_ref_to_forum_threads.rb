class AddUserRefToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_reference :forum_threads, :user, foreign_key: true
  end
end
