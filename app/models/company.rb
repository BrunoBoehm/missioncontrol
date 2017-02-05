class Company < ActiveRecord::Base
	has_many :pro_links, dependent: :delete_all
	# http://stackoverflow.com/questions/28581756/dependent-destroy-not-working
	# dependent destroy ≠ delete_all
	has_many :pins, through: :pro_links
	has_many :staffings
	has_many :people, through: :staffings

	include Taggable
	# must add in strong params { tag_ids: [] }, :tag_names
	include Profilable

	default_scope { where(account_id: Account.current_id) }
end
