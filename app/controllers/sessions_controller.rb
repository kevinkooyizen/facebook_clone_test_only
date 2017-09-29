class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email_params)
    if @user.try(:authenticate, password_params["password"])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.email}!"
      redirect_to statuses_path
    else
      flash[:alert] = "Please log in again"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
  end

  private

  def email_params
    params.require(:session).permit(:email)
  end

  def password_params
    params.require(:session).permit(:password)
  end

end
