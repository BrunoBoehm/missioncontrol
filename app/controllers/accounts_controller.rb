class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def create
		account = Account.new(account_params)
		user = current_user
		if account.save
			user.account_id = account.id
			user.save
			redirect_to boards_path
		else
			render :new, notice: "Something prevented the account from being saved, try again"
		end
	end

	private
		def account_params
			params.require(:account).permit(:name, :logo, :description)
		end
end