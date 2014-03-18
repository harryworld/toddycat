class UserAuthenticator

  def initialize(flash)
    @flash = flash
  end

  def authenticate_user(params)
    #email and password
    if User.authenticate(params[:email], params[:password])
      redirect_to root_url
    else
      @flash.now[:alert] = "Unable to log you into the system, please try again"
    end

  end


end