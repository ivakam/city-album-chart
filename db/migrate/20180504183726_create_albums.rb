class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :year
      t.string :description
      t.string :coverlink

      t.timestamps
    end
  end
end
