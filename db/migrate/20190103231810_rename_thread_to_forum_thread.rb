class RenameThreadToForumThread < ActiveRecord::Migration[5.2]
  def change
    rename_table :threads, :forum_threads
  end
end
