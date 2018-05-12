class AddFlavor < ActiveRecord::Migration[5.2]
  def change
  	add_column :albums, :flavor, :string
  end
end
