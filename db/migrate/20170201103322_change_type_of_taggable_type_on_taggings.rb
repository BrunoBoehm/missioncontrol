class ChangeTypeOfTaggableTypeOnTaggings < ActiveRecord::Migration
  def change
  	change_column :taggings, :taggable_type, :string
  	remove_index :taggings, :taggable_type
  	remove_index :taggings, :taggable_id
  	add_index :taggings, [:taggable_id, :taggable_type]
  end
end
