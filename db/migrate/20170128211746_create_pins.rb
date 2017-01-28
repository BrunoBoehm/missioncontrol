class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.string :url
      t.text :notes
      t.string :imgs

      t.timestamps null: false
    end
  end
end
