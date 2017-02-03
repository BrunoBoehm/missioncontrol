class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def destroy
		company = Company.find(params[:id])
		company.destroy
		redirect_to :back, notice: "Company was deleted"
	end
end
