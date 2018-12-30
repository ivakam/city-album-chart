class AddMoreInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :birth_year, :int
    add_column :users, :location, :string
    add_column :users, :bio, :string
  end
end
