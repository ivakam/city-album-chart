class ChangeForumThreadBodyToText < ActiveRecord::Migration[5.2]
  def change
    change_column :forum_threads, :body, :text
  end
end
