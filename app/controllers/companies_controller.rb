class CompaniesController < ApplicationController
	before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
		@companies = Company.all
	end

	def show
		
	end

	def edit
	end

	def update
		@company.update(company_params)
		redirect_to @company, notice: "Edit Successful"
	end

	def destroy
		@company.destroy
		redirect_to :back, notice: "Company was deleted"
	end

	private
		def set_company
			@company = Company.find(params[:id])
		end

		def company_params
			params.require(:company).permit(:name, :pitch, :size, :address, :creation_date, { tag_ids: [] }, :tag_names)
		end
end
