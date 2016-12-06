class UsersController < ApplicationController

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

	def check_logins
		if User.where(name: params[:name], user_password: params[:user_password]).first
			redirect_to '/home'
		else
			false
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :user_password)
	end
end
