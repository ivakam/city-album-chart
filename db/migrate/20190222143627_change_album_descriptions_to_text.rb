class ChangeAlbumDescriptionsToText < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :description, :text
  end
end
