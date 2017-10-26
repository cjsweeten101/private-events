class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:success] = "User created"
			session[:user_id] = @user.id
			redirect_to root_url
		else
			flash.now[:error] = "#{@user.errors.messages}"
			render 'new'
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:username, :password)
		end
end
