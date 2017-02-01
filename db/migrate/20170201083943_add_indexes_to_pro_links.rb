class AddIndexesToProLinks < ActiveRecord::Migration
  def change
  	add_index :pro_links, :company_id
  	add_index :pro_links, :pin_id  	
  end
end
