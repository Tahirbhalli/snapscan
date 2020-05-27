class UserController < ApplicationController
    before_action :check_session
  def index; end

  def def new
      @user = User.new
  end
  def create
    @user=User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    create_session(@user.id,[:name],params[:password])
    redirect_to profile_index_path
  end
  
  def login
    redirect_to home_user_path(session[:current_user]) if isuser?
  end

  def auth
    if User.exists?(email: params[:email], password: params[:password])
      id = User.where(email: params[:email], password: params[:password])
      
      create_session(id[0].id,id[0].name,id[0].email)
      redirect_to home_user_path(id.ids[0])
    end
  end

  private
  def create_session(id,name,email)
    session[:current_user]=id
    session[:user_email]=email
    session[:user_name]=name
  end 

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def isuser?
    return false if session[:current_user] == ''

    true
  end
  def check_session
    redirect_to profile_index_path if session[:current_user] != ""
  end
end
