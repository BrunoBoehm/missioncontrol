class CreatePinTags < ActiveRecord::Migration
  def change
    create_table :pin_tags do |t|
      t.integer :pin_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
