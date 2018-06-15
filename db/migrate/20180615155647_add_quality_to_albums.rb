class AddQualityToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :quality, :int
  end
end
