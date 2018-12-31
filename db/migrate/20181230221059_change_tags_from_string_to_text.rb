class ChangeTagsFromStringToText < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :tags, :string
    add_column :albums, :tags, :text, limit: 5000
  end
end
