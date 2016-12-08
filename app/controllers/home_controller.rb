class HomeController < ApplicationController
	helper_method :render_template_with_theme

  def index
  	user = User.find(current_user["id"])
  	if (user.template_id.to_i == 1)
  		redirect_to '/shop/theme1' if user.theme_id.to_i == 1
  	end
  end
end
