class CompaniesController < ApplicationController
	before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
		@companies = Company.all
	end

	def show
		@social_profile = @company.social_profiles.first
	end

	def edit
		@social_profile = @company.social_profiles.build if @company.social_profiles.length == 0
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
			params.require(:company).permit(:name, :pitch, :size, :address, :creation_date, { tag_ids: [] }, :tag_names, social_profiles_attributes: [:fb_url, :tw_url, :ln_url, :ig_url, :yt_url, :db_url, :med_url, :site_url, :blog_url])
		end
end
