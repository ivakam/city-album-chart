class RemoveUpvotedPostsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :upvoted_posts
    create_table :upvotes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
