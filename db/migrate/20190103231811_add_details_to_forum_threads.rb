class AddDetailsToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :stickied, :boolean
    add_column :forum_threads, :archived, :boolean
    add_column :forum_threads, :locked, :boolean
  end
end
