class PinsController < ApplicationController
	before_action :set_pin, only: [:show]

	def index
		@pins = Pin.all
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		if @pin.save
			redirect_to @pin
		else
			render :new
		end
	end

	def show
		
	end

	private
		def set_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:title, :url, :notes, :imgs)
		end
end
