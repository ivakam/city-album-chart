class ChangeTempImage < ActiveRecord::Migration[5.2]
  def change
    change_table :albums do |t|
      t.remove :temp_image
      t.string :image
    end
  end
end
