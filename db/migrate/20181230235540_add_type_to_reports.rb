class AddTypeToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :type, :string
  end
end
