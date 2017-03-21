class Board < ActiveRecord::Base
	has_many :board_pins
	has_many :pins, through: :board_pins
	has_many :tags, through: :pins
	# belongs_to :account

	default_scope { where(account_id: Account.current_id) }
	validates :title, presence: true

	def self.with_most_pins
		joins(:board_pins).group("boards.id").order("count(boards.id) desc").limit(4)
	end
end
