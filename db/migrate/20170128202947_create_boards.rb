class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.text :description
      t.string :img
      t.string :color

      t.timestamps null: false
    end
  end
end
