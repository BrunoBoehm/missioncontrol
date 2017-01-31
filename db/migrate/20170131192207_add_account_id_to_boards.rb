class AddAccountIdToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :account_id, :integer
  end
end
