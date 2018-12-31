class AddTagsToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :tags, :string
  end
end
