class AddKarmaToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :karma, :int
    add_column :users, :admin, :boolean
    add_column :users, :banned, :boolean
  end
end
