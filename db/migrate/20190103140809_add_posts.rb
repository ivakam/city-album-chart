class AddPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :threads do |t|
      t.string :title
      t.string :category
      t.integer :score
      t.timestamps
    end
    
    create_table :posts do |t|
      t.belongs_to :thread, index: true
      t.text :body
      t.integer :score
      t.timestamps
    end
  end
end
