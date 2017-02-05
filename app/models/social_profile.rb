class SocialProfile < ActiveRecord::Base
	belongs_to :profilable, polymorphic: true
end
