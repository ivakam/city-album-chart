class AddResetPasswordTokenAndExpirationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_token_expired, :boolean, default: false
    add_column :users, :reset_password_token, :string
  end
end
