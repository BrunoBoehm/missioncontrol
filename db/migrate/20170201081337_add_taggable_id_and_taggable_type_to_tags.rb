class AddTaggableIdAndTaggableTypeToTags < ActiveRecord::Migration
  def change
    add_column :tags, :taggable_id, :integer
    add_index :tags, :taggable_id
    add_column :tags, :taggable_type, :string
    add_index :tags, :taggable_type
  end
end
