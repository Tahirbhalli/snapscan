class Account::TransactionsController < Account::BaseController
  def index
    @tran = Transactin.includes(:user).where(user_id: session[:current_user]).order('name ASC')
  end

  def new
    @transac = Transactin.new
  end

  def create
    if current_user.transactins.exists?(transaction_param)
      flash[:msg] = 'esists'
    else
      @transac = current_user.transactins.create(transaction_param)

    end
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
