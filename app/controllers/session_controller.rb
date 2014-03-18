class SessionController < ApplicationController

  # skip_before_action :verify_authenticity_token

  def new
    # @messages = flash.inspect
    # @messages = flash.map {| key, value| "#{key.capitalize}: #{value}"}.join(";")
    # render text: "Display the log in form."
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    if params[:user][:password].blank?
      #password reset flow
      PasswordResetter.new(flash).handle_reset_request(user_params)
    else
      #authenticate password flow
      UserAuthenticator.new(flash).authenticate_user(user_params)
    end
    render :new
  end

  def destroy
    session[:user_id] = nil
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
