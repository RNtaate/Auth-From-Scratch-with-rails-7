class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Email or password is incorrect!"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil if session[:user_id]
      redirect_to login_path, notice: "Logged out successfully!"
    else
      render :new
    end
  end
end
