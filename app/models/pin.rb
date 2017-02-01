class Pin < ActiveRecord::Base
	has_many :board_pins
	has_many :boards, through: :board_pins

	has_many :perso_links
	has_many :people, through: :perso_links
	
	has_many :pro_links
	has_many :companies, through: :pro_links

	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings

	accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
	default_scope { where(account_id: Account.current_id) }
end
