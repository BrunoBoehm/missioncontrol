class BoardsController < ApplicationController
	before_action :set_board, only: [:show, :edit, :update]
	# skip_before_action :authenticate_user!, only: [:index]
	# http://stackoverflow.com/questions/36302866/how-do-i-make-a-before-action-to-run-on-all-controllers-and-actions-except-one

	def index
		@boards = Board.all
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		if @board.save
			redirect_to @board
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @board.update(board_params)
			redirect_to @board
		else
			render :edit
		end
	end

	private
		def set_board
			@board = Board.find(params[:id])
		end

		def board_params
			params.require(:board).permit(:title, :description, :img, :color)
		end	
end
