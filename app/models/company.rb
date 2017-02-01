class Company < ActiveRecord::Base
	has_many :pro_links
	has_many :pins, through: :pro_links
	has_many :staffings
	has_many :persons, through: :staffings
	has_one :social_profile

	default_scope { where(account_id: Account.current_id) }
end
