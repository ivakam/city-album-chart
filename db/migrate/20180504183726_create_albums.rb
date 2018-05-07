class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :romanization
      t.string :romaji_artist
      t.string :japanese_artist
      t.string :year
      t.string :description
      t.string :coverlink

      t.timestamps
    end
  end
end
