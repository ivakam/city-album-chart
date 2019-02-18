class AddNotificationTable < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.string :notification_type
      t.bigint :target_id
      t.timestamps
    end
  end
end
