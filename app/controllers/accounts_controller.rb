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

	def edit
		@account = current_account
	end

	def update
		account = Account.find(current_account.id)
		if account.update(account_params)
			redirect_to account, notice: "Account updated!"
		else
			render :edit
		end	
	end

	def show
		@account = current_account
	end

	private
		def account_params
			params.require(:account).permit(:name, :logo, :description)
		end
end