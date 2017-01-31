class AddAccountIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :account_id, :integer
    add_index :pins, :account_id
  end
end
