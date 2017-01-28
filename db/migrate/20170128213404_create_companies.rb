class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :pitch
      t.string :address
      t.string :size
      t.integer :creation_date

      t.timestamps null: false
    end
  end
end
