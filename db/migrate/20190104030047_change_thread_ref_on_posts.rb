class ChangeThreadRefOnPosts < ActiveRecord::Migration[5.2]
  def change 
    change_table :posts do |t|
      t.remove_references :thread
      t.belongs_to :forum_thread
    end
  end
end
