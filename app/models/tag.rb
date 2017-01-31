class Tag < ActiveRecord::Base
	has_many :pin_tags
	has_many :pins, through: :pin_tags
	default_scope { where(account_id: Account.current_id) }
end
