class UserController < ApplicationController
  before_action :check_session
  def index; end

  def def(_new)
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    create_session(@user.id, params[:name], params[:password])
    redirect_to profile_index_path
  end

  def login
    # redirect_to home_user_path(session[:current_user]) if isuser?
  end

  def auth
    if User.exists?(email: params[:email], password: params[:password])
      id = User.where(email: params[:email], password: params[:password])

      create_session(id[0].id, id[0].name, id[0].email, id[0].pic_url)
      redirect_to profile_index_path(id.ids[0])
    else
      flash[:msg] = 'Invalid Username or Password'
      redirect_to login_user_index_path
    end
  end

  private

  def create_session(id = '', name = '', email = '', url = '')
    session[:current_user] = id
    session[:user_email] = email
    session[:user_name] = name
    session[:pic_url] = url
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def check_session
    # byebug
    redirect_to profile_index_path unless session[:current_user].nil?
  end
end
