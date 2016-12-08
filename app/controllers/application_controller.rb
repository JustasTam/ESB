class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :loged_in?
  helper_method :current_user
  helper_method :access_allowed?

  def current_user
		session[:current_user]  	
  end

  def loged_in?
  	current_user.present? ? true : (redirect_to '/login')
  end

  def access_allowed?
  	if current_user.present?
  		return true
  	else
  		session[:error] = 'You are not allowed to see that information! Please log in first.' 
  		redirect_to '/login'
  	end
  end
end
