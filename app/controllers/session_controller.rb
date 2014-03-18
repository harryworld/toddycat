class SessionController < ApplicationController

  # skip_before_action :verify_authenticity_token

  def new
    # @messages = flash.inspect
    # @messages = flash.map {| key, value| "#{key.capitalize}: #{value}"}.join(";")
    # render text: "Display the log in form."
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user
      # password reset
      if password.blank?
        if user.set_password_reset

          begin
            UserNotifier.reset_password(user).deliver
            flash.now[:notice] = "We'll send you an email with instrutions for resetting"
          rescue
            flash.now[:alert] = "Unable to send email. Please notify webmaster"
          end

        else
          flash.now[:alert] = "Password reset failed."
        end
          render :new
      elsif user.authenticate(password)
        #user authentication
        session[:user_id] = user.id
        redirect_to root_url
      end

    else
      # failure
      flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've successfully logged out."
  end
end