class PasswordResetter

  def initialize(flash)
    @flash = flash
  end

  def handle_reset_request(params)
    if @user = User.find_by(email: params[:email])
      if @user.set_password_reset
        #code for our email sending and error catching
        begin
          UserNotifier.reset_password(@user).deliver
          @flash.now[:notice] = "We'll send you an email with instrutions for resetting"
        rescue
          @flash.now[:alert] = "Unable to send email. Please notify webmaster"
        end

      else
        @flash.now[:alert] = "Password reset failed. Please notify webmaster"
      end
    else
      @flash.now[:alert] = "Unable to log you in. Please check your Email and Password again "
    end
  end
end
