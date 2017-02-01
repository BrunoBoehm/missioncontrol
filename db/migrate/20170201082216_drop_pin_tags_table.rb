class DropPinTagsTable < ActiveRecord::Migration
  def change
  	drop_table :pin_tags
  end
end
