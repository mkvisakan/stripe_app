class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :profiles, :remember_token, :string
    add_index :profiles, :remember_token
  end
end
