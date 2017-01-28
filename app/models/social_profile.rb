class SocialProfile < ActiveRecord::Base
	belongs_to :person
	belongs_to :company
	#social profilable ? cf guest dans flatiron BNB?
end
