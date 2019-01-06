class AddFavoritesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :album_fav, :string
  end
end
