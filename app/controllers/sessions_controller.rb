class SessionsController < ApplicationController
  before_action :confirm_already_signed_in?, only: [:new, :create]
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

  private

  def confirm_already_signed_in?
    if current_user
      redirect_to root_path, notice: "You are already signed in."
    end
  end
end
