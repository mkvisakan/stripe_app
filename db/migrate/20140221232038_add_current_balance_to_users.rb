class AddCurrentBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_balance, :integer, default: 0
  end
end
