class SessionsController < ApplicationController
	def new
	end

	def create
		if @user = User.find_by(username: session_params[:username])
			session[:user_id] = @user.id
			redirect_to root_url
		else
			flash.now[:error] = "Please try again"
			render 'new'
		end
	end

	def delete
		reset_session
		redirect_to root_url
	end

	private

		def session_params
			params.require(:session).permit(:username, :password)
		end	
end
