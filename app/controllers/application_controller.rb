class ApplicationController < ActionController::Base
  helper_method :current_user

  def authenticate_user!
    if !current_user
      redirect_to login_path, notice: "You need to sign in or sign up"
    end
  end

  private
  def current_user
    #The ||= symbol represents "equals or" which in ruby helps for a value to be cached.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
