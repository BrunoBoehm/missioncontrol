class Tag < ActiveRecord::Base
	belongs_to :taggable, polymorphic: true
	validates_uniqueness_of :name, case_sensitive: false
	
	default_scope { where(account_id: Account.current_id) }
end
