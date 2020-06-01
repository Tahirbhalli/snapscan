class ProfileController < ApplicationController
  before_action :check_session
  def index
    # session[:current_user]=1
  end

  def logout
    destroy_session
    redirect_to user_index_path
  end

  def transactions
    @tran = User.find(session[:current_user])
  end

  private

  def destroy_session
    session[:current_user] = nil
    session[:user_email] = nil
    session[:user_name] = nil
    session[:pic_url] = nil
  end

  def check_session
    redirect_to user_index_path if session[:current_user].nil?
  end
end
