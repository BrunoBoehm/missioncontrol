class PeopleController < ApplicationController
	before_action :set_person, only: [:show, :edit, :update, :destroy]

	def index
		@people = Person.all
	end

	def show
		@social_profile = @person.social_profiles.first
	end

	def edit
		@social_profile = @person.social_profiles.build if @person.social_profiles.length == 0
	end

	def update
		if @person.update(person_params)
			redirect_to @person, notice: "Well done"
		else
			render :edit, notice: "Couldn't be updated"
		end
	end

	def destroy
		@person.destroy
		redirect_to people_path, notice: "Person deleted"
	end

	private
		def set_person
			@person = Person.find(params[:id])
		end

		def person_params
			params.require(:person).permit(:name, :surname, :img, { tag_ids: [] }, :tag_names, social_profiles_attributes: [:fb_url, :tw_url, :ln_url, :ig_url, :yt_url, :db_url, :med_url, :site_url, :blog_url])
		end
end
