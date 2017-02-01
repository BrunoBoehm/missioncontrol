class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :pins, through: :taggings

	validates_uniqueness_of :name, case_sensitive: false
	
	default_scope { where(account_id: Account.current_id) }
end
