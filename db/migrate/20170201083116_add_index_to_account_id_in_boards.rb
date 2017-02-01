class AddIndexToAccountIdInBoards < ActiveRecord::Migration
  def change
  	add_index :boards, :account_id
  end
end
