class ChangeUpvotedToPostsUpvoted < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :upvoted, :upvoted_posts
  end
end
