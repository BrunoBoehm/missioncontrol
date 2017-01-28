class CreateProLinks < ActiveRecord::Migration
  def change
    create_table :pro_links do |t|
      t.integer :pin_id
      t.integer :company_id
      t.string :nature

      t.timestamps null: false
    end
  end
end
