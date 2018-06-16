class AddScraperToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :scraper, :string
  end
end
