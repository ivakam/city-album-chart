class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :badges, :string
    add_column :users, :account_type, :string
  end
end
