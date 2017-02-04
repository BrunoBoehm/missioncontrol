class PinsController < ApplicationController
	before_action :set_pin, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag]
			tag = Tag.find(params[:tag_id])
			@pins = tag.pins
		else
			@pins = Pin.all
		end
	end

	def new
		if params[:board_id]
			@pin = Pin.new(board_ids: params[:board_id])
		else
			@pin = Pin.new	
		end
		3.times do
			company = @pin.companies.build
		end
	end

	def create
		@pin = Pin.new(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Pin successfully saved, congrats"
		else
			render :new
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin successfully updated and saved, see for yourself ;)"
		else
			render :edit
		end
	end

	def destroy
		@pin.destroy
		redirect_to pins_path, notice: "As the French put it: 1 lost, 10 found."
	end

	private
		def set_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:title, :url, :notes, :imgs, board_ids: [], tag_ids: [], tags_attributes: [:name], companies_attributes: [:name, :id, :_destroy], people_attributes: [:name, :surname])
		end
end
