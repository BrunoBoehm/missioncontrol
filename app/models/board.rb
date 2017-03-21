class Board < ActiveRecord::Base
	has_many :board_pins
	has_many :pins, through: :board_pins
	has_many :tags, through: :pins
	# belongs_to :account

	default_scope { where(account_id: Account.current_id) }
	validates :title, presence: true

	def self.recent
		order(created_at: :desc).limit(3)
	end
end
