class AddThreadToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :thread, :string
  end
end
