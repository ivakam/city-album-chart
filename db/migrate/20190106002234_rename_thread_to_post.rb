class RenameThreadToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :post, :string
  end
end
