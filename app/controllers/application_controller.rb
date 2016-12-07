class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :loged_in?
  helper_method :current_user

  def current_user
		session[:current_user]  	
  end

  def loged_in?
  	current_user.present? ? true : (redirect_to '/login')
  end
end
