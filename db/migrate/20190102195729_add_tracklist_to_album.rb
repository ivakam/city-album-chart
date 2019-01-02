class AddTracklistToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :tracklist, :string
  end
end
