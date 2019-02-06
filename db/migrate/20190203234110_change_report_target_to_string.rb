class ChangeReportTargetToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :target_id
    add_column :reports, :target_id, :string
  end
end
