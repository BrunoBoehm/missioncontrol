class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :delete_all
	has_many :pins, through: :taggings, source: :taggable, source_type: 'Pin'
	has_many :companies, through: :taggings, source: :taggable, source_type: 'Company'
	has_many :people, through: :taggings, source: :taggable, source_type: 'Person'

	validates_uniqueness_of :name, case_sensitive: false
	
	default_scope { where(account_id: Account.current_id) }
end
