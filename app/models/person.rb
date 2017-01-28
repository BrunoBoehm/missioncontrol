class Person < ActiveRecord::Base
	has_many :perso_links
	has_many :pins, through: :perso_links
	has_many :staffings
	has_many :companies, through: :staffings
	has_one :social_profile
end
