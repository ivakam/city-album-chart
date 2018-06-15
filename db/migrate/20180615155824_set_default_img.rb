class SetDefaultImg < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :coverlink, :string, :default => "missingcover.jpg"
  end
end
