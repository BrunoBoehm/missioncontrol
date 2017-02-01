class AddIndexesToStaffings < ActiveRecord::Migration
  def change
  	add_index :staffings, :person_id
  	add_index :staffings, :company_id  	
  end
end
