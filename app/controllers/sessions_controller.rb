class SessionsController < ApplicationController 

	def new
	end

	def create 
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:email])
			flash[:notice] = "Logged in!"
			session[:user_id] = user.id 
			redirect_to root_url 
		else
			flash[:notice] = "Email or password is invalid."
			render "new"
		end
	end 

	def destroy 
		session[:user_id] = nil 
		redirect_to root_url
		flash[:notice] = "Logged out!"
	end

private 

	def user_params 
		params.require(:user).permit(:email, :password, :password_confirmation)
	end  
end 