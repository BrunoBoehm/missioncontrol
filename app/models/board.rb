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

	def self.with_recent_pins
		select("boards.*").joins(:board_pins).order("board_pins.updated_at DESC").limit(4)
		# working but shows duplicate boards if 2 or more pins are the latest updates overall

		# find_by_sql("SELECT DISTINCT ON (boards.id) boards.* FROM boards JOIN board_pins ON boards.id = board_pins.board_id ORDER BY boards.id, board_pins.updated_at DESC WHERE boards.account_id = ? LIMIT 4", Account.current_id)

		# find_by_sql("SELECT boards.* FROM boards table1 JOIN (SELECT board_id, MAX(updated_at) AS latest FROM board_pins GROUP BY board_id)table2 ON table1.id = table2.board_id")
	end

# board.id 	board.title			board_pins.id 		board_pins.board_id 	board_pins.pin_id  	board_pins.updated_at
# 1			titre1									1						4					today
# 1			titre1									1						6					yesterday
# 1			titre1									1						2					one week ago
# 2			titre2									2						3					today
# 2			titre2									2						8					today
# 3			titre3									3						1					yesterday

# for each board, take the latest update, rank them and take only 4 DESC

end
