class Tag < ActiveRecord::Base
	belongs_to :taggable, polymorphic: true
	
	default_scope { where(account_id: Account.current_id) }
end
