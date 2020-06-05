class ProfileController < ApplicationController
  before_action :check_session
  def index
    @curent = User.find(session[:current_user])
  end

  def new
    @transac = Transactin.new
  end

  def create
    @curent = User.find(session[:current_user])
    @transac = @curent.transactins.create(name: params[:name], amount: params[:amount])
    redirect_to profile_index_path
  end

  def group_create
    @curent = User.find(session[:current_user])
    @new_group = @curent.groups.create(group_param)
    redirect_to profile_index_path
  end

  def add
    @tr = Transactin.all
  end

  def added
    if Groupmember.exists?(Transactin_id: params[:t_id], group_id: params[:g_id])
      obj = Groupmember.where(Transactin_id: params[:t_id], group_id: params[:g_id])
      Groupmember.destroy(obj.ids)
    else
      obj = Groupmember.new(transactin_id: params[:t_id], group_id: params[:g_id])
      obj.save
    end
    redirect_to all_groups_profile_path(session[:current_user])
  end

  def join
    res = Particpent.exists?(user_id: session[:current_user], group_id: params[:id])
    if res
      obj = Particpent.where(user_id: session[:current_user], group_id: params[:id])
      Particpent.destroy(obj.ids)
    else
      Particpent.create(user_id: session[:current_user], group_id: params[:id])
    end
    redirect_to all_groups_profile_path(session[:current_user])
  end

  def grouptrans
    @result = Transactin.where(id: Groupmember.where(group_id: params[:id]).select('Transactin_id'))
  end

  def logout
    destroy_session
    redirect_to user_index_path
  end

  def transactions
    @tran=Transactin.includes(:user).where(user_id: session[:current_user]).order('name ASC')
  end

  def external
    a=Transactin.includes(:user).where(user_id: session[:current_user])
    @external =a.where.not(id: Groupmember.all.select('transactin_id')).order('name ASC')
  end

  def groups
    @groups = Group.all
  end

  def newgroup
    @group = Group.new
  end

  private

  def group_param
    params.require(:group).permit(:name, :cover_pic)
  end

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
