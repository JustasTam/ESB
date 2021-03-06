class UsersController < ApplicationController
	helper_method :update_user_template
	helper_method :update_user_theme

	def register
		@user = User.new
	end

	def create
		session[:error] = nil
		check_if_not_a_duplicate = User.where(name: params[:user][:name]).present?

		if check_if_not_a_duplicate.blank?
			@user = User.new(user_params)

			if @user.save
				flash[:notice] = "You have succesfully registered!"
				redirect_to '/login'
			else
				flash[:error] = "Ups! Something is not wright!?"
				redirect_to '/register'
			end
		else
			session[:error] = 'Sorry, but this username is allready taken.'
			redirect_to '/register'
		end
	end

	def validate_login
		session[:error] = nil
		check_if_registered = User.where(name: params[:name]).present?
		check_if_pasword_is_correct = User.where(name: params[:name], user_password: params[:user_password]).present?

		if check_if_registered.present?
			if check_if_pasword_is_correct.present?
				session[:current_user] = User.where(name: params[:name], user_password: params[:user_password]).first

				if have_template_and_theme?
					redirect_to '/home'
				else
					redirect_to '/choose_template'
				end
			else
				session[:error] = 'Password is incorect!'
				redirect_to '/login'
			end
		else
			session[:error] = 'Sorry, but there is no such user.'
			redirect_to '/login'
		end
	end

	def update_user_template(template_id)
		if current_user
			User.find(current_user["id"]).update_attribute :template_id, template_id
		end
	end

	def update_user_theme(theme_id)
		if current_user
			User.find(current_user["id"]).update_attribute :theme_id, theme_id
		end
	end

	def have_template_and_theme?
		current_user[:template_id].present? && current_user[:theme_id].present?
	end

	private

	def user_params
		params.require(:user).permit(:name, :user_password)
	end
end
