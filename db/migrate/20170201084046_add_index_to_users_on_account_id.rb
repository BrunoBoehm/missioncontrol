class AddIndexToUsersOnAccountId < ActiveRecord::Migration
  def change
  	  add_index :users, :account_id
  end
end
