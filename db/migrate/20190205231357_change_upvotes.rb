class ChangeUpvotes < ActiveRecord::Migration[5.2]
  def change
    change_table :upvotes do |t|
      t.bigint :target_id
    end
  end
end
