class AddBodyToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :body, :string
  end
end
