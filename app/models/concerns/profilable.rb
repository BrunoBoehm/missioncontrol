module Profilable
	extend ActiveSupport::Concern

	included do
		has_many :social_profiles, as: :profilable	
		accepts_nested_attributes_for :social_profiles
	end

end