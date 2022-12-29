def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send mail
      PasswordMailer.with(user: @user).reset.deliver_later
      # deliver_later is provided by ActiveJob
    end
    redirect_to root_path, notice: 'Please check your email to reset the password'
  end