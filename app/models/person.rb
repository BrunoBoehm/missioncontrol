class Person < ActiveRecord::Base
	has_many :perso_links, dependent: :delete_all
	has_many :pins, through: :perso_links
	has_many :staffings
	has_many :companies, through: :staffings

	include Taggable
	# must add in strong params { tag_ids: [] }, :tag_names	
	include Profilable

	default_scope { where(account_id: Account.current_id) }

	def full_name
		name + " " + surname
	end
end
