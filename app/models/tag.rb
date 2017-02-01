class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :destroy
	has_many :pins, through: :taggings, source: :taggable, source_type: 'Pin'

	validates_uniqueness_of :name, case_sensitive: false
	
	default_scope { where(account_id: Account.current_id) }
end
