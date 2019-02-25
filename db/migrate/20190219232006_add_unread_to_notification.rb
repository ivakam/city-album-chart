class AddUnreadToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :unread, :boolean, :default => true
  end
end
