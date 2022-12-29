class SessionsController < ApplicationController 
	def new
	end

	def create
		user = User.find_by(email:params[:email])
		#finds existing user check to see if the user has authenticated 
		if user.present? && user.authenticate(params[:password])	
		#sets up user.id sessions 
		redirect_to root_path, notice:'Logged in Succsssfully'
		else
		flash.now[:alert]='Invalid email or password'
		render :new	
		end
	end

	def destroy
		session[user_id] = nil
		redirect_to root_path,notice:'Logged Out'
	end




end

