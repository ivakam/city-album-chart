class AddTimestampsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :articles, null: false
    add_timestamps :comments, null: false
  end
end
