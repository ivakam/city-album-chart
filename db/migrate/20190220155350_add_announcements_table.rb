class AddAnnouncementsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.belongs_to :user
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
