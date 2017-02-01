class AddIndexesOnBoardPins < ActiveRecord::Migration
  def change
  	add_index :board_pins, :board_id
  	add_index :board_pins, :pin_id
  end
end
