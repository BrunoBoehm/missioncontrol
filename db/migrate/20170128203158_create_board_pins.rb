class CreateBoardPins < ActiveRecord::Migration
  def change
    create_table :board_pins do |t|
      t.integer :board_id
      t.integer :pin_id

      t.timestamps null: false
    end
  end
end
