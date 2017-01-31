class Account < ActiveRecord::Base
	has_many :users
	# has_many :boards

	# cattr_accessor :current_id
	def self.current_id=(id)
		Thread.current[:account_id] = id
	end

	def self.current_id
		Thread.current[:account_id]
	end

end
