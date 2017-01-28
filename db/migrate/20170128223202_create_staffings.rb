class CreateStaffings < ActiveRecord::Migration
  def change
    create_table :staffings do |t|
      t.integer :person_id
      t.integer :company_id
      t.boolean :actual

      t.timestamps null: false
    end
  end
end
