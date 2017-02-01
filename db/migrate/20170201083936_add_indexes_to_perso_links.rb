class AddIndexesToPersoLinks < ActiveRecord::Migration
  def change
  	add_index :perso_links, :person_id
  	add_index :perso_links, :pin_id  	
  end
end
