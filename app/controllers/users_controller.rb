class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			redirect_to @user
		else
			render 'new'
		end
	end

	def index
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :gender, :password,
										 :password_confirmation, :avatar)
		end
end