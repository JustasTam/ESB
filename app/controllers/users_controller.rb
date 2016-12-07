class UsersController < ApplicationController
	helper_method :update_user_template

	def register
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "You have succesfully registered!"
		else
			flash[:error] = "Ups! Something is not wright!?"
		end

		redirect_to '/login'
	end

	def validate_login
		@current_user = User.where(name: params[:name], user_password: params[:user_password]).first

		if @current_user
			session[:current_user] = @current_user
			flash[:notice] = "Welcome!"
			redirect_to '/choose_template'
		else
			false
		end
	end

	def update_user_template(template_id)
		if current_user
			User.find(current_user["id"]).update_attribute :template, template_id
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :user_password)
	end
end
