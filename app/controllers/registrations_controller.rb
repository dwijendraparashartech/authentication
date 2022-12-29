class RegistrationsController < ApplicationController
	def new 
		@user = User.new
	end

	def create 
		debugger
		@user = User.new(user_params)
		if @user.save
	      WelcomeMailer.with(user: @user).welcome_email.deliver_now

		#store saved user in a session 
			session[:user_id] = @user.id
			redirect_to root_path, notice: 'Successfully Created Account'
		else
			render :new
		end
	end

	private 

	def user_params
		params.require(:user).permit(:email,:password,:password_confirmation)
	end

end
