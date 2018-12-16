class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :album
      t.string :reason
      t.string :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
