class AddOrderToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :order, :int
  end
end
