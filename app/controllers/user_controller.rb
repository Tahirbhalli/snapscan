class UserController < ApplicationController
  def index; end

  def login
    redirect_to home_user_path(session[:current_user]) if isuser?
  end

  def auth
    if User.exists?(email: params[:email], password: params[:password])
      id = User.where(email: params[:email], password: params[:password])
      session[:current_user] = id.ids[0]
      session[:user_name]=id.name
      session[:user_email]=id.email
      redirect_to home_user_path(id.ids[0])
    end
    render :login
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def isuser?
    return false if session[:current_user] == ''

    true
  end
end
