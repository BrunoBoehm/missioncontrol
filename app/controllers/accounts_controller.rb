class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		user = current_user
		if @account.save
			user.account_id = @account.id
			user.save
			redirect_to boards_path
		else
			flash.now[:alert] = "Upsss: " + @account.errors.full_messages.join(', ')
			render :new
		end
	end

	def edit
		@account = current_account
	end

	def update
		# instance variable to benefit from view errors if fails
		@account = Account.find(current_account.id)
		if @account.update(account_params)
			redirect_to account, notice: "Account updated!"
		else
			flash.now[:alert] = "Upsss: " + @account.errors.full_messages.join(', ')
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
