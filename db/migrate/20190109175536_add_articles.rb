class AddArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.belongs_to :user
      t.boolean :featured
      t.string :category
    end
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user
      t.boolean :pinned
      t.belongs_to :article
    end
    change_table :upvotes do |t|
      t.belongs_to :comment
      t.belongs_to :article
    end
    remove_column :forum_threads, :score
  end
end
