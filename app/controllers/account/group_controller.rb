class Account::GroupController < Account::BaseController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    if Group.exists?(name: group_param['name'])
      flash[:msg] = 'Group already exists'
      redirect_to new_account_profile_group_path(session[:current_user])
    else
      # @curent = User.find(session[:current_user])
      @new_group = current_user.groups.create(group_param)
      redirect_to account_profile_index_path(session[:current_user])
    end
  end

  def grouptransactions
    @result = Transactin.where(id: Groupmember.where(group_id: params[:group_id]))
  end

  def join
    res = Particpent.exists?(user_id: session[:current_user], group_id: params[:group_id])
    if res
      obj = Particpent.where(user_id: session[:current_user], group_id: params[:group_id])
      Particpent.destroy(obj.ids)
    else
      Particpent.create(user_id: session[:current_user], group_id: params[:group_id])
    end
    redirect_to account_profile_group_index_path(session[:current_user])
  end

  def add
    @tr = current_user.transactins.all # Transactin.all
  end

  def added
    if Groupmember.exists?(Transactin_id: params[:t_id], group_id: params[:group_id])
      obj = Groupmember.where(Transactin_id: params[:t_id], group_id: params[:group_id])
      Groupmember.destroy(obj.ids)
    else
      obj = Groupmember.new(transactin_id: params[:t_id], group_id: params[:group_id])
      obj.save
    end
    redirect_to account_profile_group_index_path(session[:current_user])
  end

  private

  def group_param
    params.require(:group).permit(:name, :cover_pic)
  end
end
