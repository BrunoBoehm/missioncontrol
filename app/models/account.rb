class Account < ActiveRecord::Base
	has_many :users
	# has_many :boards
	validates :name, presence: true

	# cattr_accessor :current_id
	# better than cattr_accessor is the following "thread safe" method:
	# https://blog.engineyard.com/2011/a-modern-guide-to-threads
	def self.current_id=(id)
		Thread.current[:account_id] = id
	end

	def self.current_id
		Thread.current[:account_id]
	end

end
