class ChangeReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :thread
    remove_column :reports, :post
    add_column :reports, :target_id, :int
  end
end
