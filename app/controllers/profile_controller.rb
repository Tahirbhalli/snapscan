class ProfileController < ApplicationController
  before_action :check_session
  def index
    @curent = User.find(session[:current_user])
  end

  def new
    @transac = Transaction.new
  end

  def create
    @curent = User.find(session[:current_user])
    @transac = @curent.transactions.create(name: params[:name], amount: params[:amount])
    redirect_to profile_index_path
  end

  def group_create
    @curent = User.find(session[:current_user])
    @new_group = @curent.groups.create(name: params[:name])
    redirect_to profile_index_path
  end

  def logout
    destroy_session
    redirect_to user_index_path
  end

  def transactions
    @tran = User.find(session[:current_user]).transactions
  end
  def external
    @external = User.find(session[:current_user]).transactions
  end
  def groups
    @groups=Group.all
    #@curent=User.find(session[:current_user])
    #@groups=@curent.groups
    
  end

  def newgroup; end

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
