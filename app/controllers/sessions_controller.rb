class SessionsController < ApplicationController
	def new
		render 'new'
	end

	def create
		user = User.find_by(name: params[:session][:name].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
		else
			flash.now[:error] = "Invalid name/password combination" # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
