class AddTracklistMk2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :tracklist
    add_column :albums, :temp_tracklist, :string
  end
end
