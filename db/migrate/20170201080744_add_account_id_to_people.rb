class AddAccountIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :account_id, :integer
    add_index :people, :account_id
  end
end
