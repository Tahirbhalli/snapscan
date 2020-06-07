class Account::TransactionsController < Account::BaseController
  def index
    @tran = Transactin.includes(:user).where(user_id: session[:current_user]).order('name ASC')
  end

  def new
    @transac = Transactin.new
  end

  def create
    @curent = User.find(session[:current_user])
    @transac = @curent.transactins.create(transaction_param)
    redirect_to account_profile_transactions_path(session[:current_user])
  end

  def external
    a = Transactin.includes(:user).where(user_id: session[:current_user])
    @external = a.where.not(id: Groupmember.all.select('transactin_id')).order('name ASC')
  end

  def join
    @groups = Group.all
  end

  private

  def transaction_param
    params.permit(:name, :amount)
  end
end
