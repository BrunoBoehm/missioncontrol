class ProLinksController < ApplicationController

	def index
		@pro_links = ProLink.all
	end
end