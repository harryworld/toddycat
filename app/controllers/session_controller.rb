class SessionController < ApplicationController

  # skip_before_action :verify_authenticity_token

  def new
    # render text: "Display the log in form."
  end

  def create
    # render json: params
    # render text: "Log   #{params[:user][:email]} in with #{params[:user][:password]}."
    render text: User.authenticate(params[:user][:email], params[:user][:password])
  end

  def destroy
    render text: "Log the user out."
  end
end