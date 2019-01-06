class RemoveScoreFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :score
  end
end
