class ChangeLinkToText < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :thumbnail, :text, :limit => 1000
  end
end
