class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # Devise: routes to the login / signup if not authenticated

  helper_method :current_account
  # helper_method is to explicitly share some methods defined in the controller to make them available for the view.
  # This is used for any method that you need to access from both controllers and helpers/views

  around_filter :scope_current_account

  private
  # http://stackoverflow.com/questions/7323792/rails-share-information-within-a-request-scope
  def current_account
		current_user.account if current_user
	end

	def scope_current_account
		Account.current_id = current_account.id if current_account
		yield
	ensure
		Account.current_id = nil
	end
end
