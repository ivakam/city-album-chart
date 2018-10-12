class ChangeLinkToText4 < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :coverlink, :string
    add_column :albums, :coverlink, :text, :limit => 1000
  end
end
