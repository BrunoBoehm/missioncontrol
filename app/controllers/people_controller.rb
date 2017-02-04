class PeopleController < ApplicationController
	before_action :set_person, only: [:show, :edit, :update, :destroy]

	def index
		@people = Person.all
	end

	def show
		
	end

	def edit
		
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
			params.require(:person).permit(:name, :surname, :img)
		end
end
