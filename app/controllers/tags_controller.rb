class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]

	def index
		@tag = Tag.new
		@tags = Tag.all
	end

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			redirect_to tags_path, notice: "Tag created!"
		else
			render :index
		end
	end

	def edit
		
	end

	def show 
	end

	def update
		if @tag.update(tag_params)
			redirect_to tags_path, notice: "The edit went real fine!"
		else
			render :edit
		end
	end

	def destroy
		@tag.delete
		redirect_to tags_path, notice: "Tag deleted!"
	end

	private
		def tag_params
			params.require(:tag).permit(:name)
		end

		def set_tag
			@tag = Tag.find(params[:id])
		end

end