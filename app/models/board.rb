class Board < ActiveRecord::Base
	has_many :board_pins
	has_many :pins, through: :board_pins
	has_many :tags, through: :pins
	belongs_to :account
end
