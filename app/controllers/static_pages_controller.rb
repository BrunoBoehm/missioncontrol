class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!
	# makes sure we can access the static pages (HP) without having to register with Devise

	def home

	end
end
