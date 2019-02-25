class AddSubscriptionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.string :subscription_type
      t.bigint :target_id
      t.timestamps
    end
  end
end
