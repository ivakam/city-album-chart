class RemoveKarmaFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :karma
  end
end
