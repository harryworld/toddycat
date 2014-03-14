class SiteController < ApplicationController

  def index
    # render json: User.all.entries
    # @users = User.all.entries
    render text: is_authenticated?
  end

  def privacy
  end

  def terms
  end

  def wdi
    @fuck = "you"
  end

end