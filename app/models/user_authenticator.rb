class UserAuthenticator

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def authenticate_user(params)
    #email and password
    if @user = User.authenticate(params[:email], params[:password])
      @session[:user_id] = @user.id
    else
      @flash.now[:alert] = "Unable to log you into the system, please try again"
    end

  end


end