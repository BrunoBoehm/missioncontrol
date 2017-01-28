class CreatePersoLinks < ActiveRecord::Migration
  def change
    create_table :perso_links do |t|
      t.integer :pin_id
      t.integer :person_id
      t.string :nature

      t.timestamps null: false
    end
  end
end
