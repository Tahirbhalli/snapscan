class Account::ProfileController < Account::BaseController
  def index
    @user = User.new
  end

  def destroy
    session[:current_user] = nil
    session[:user_email] = nil
    session[:user_name] = nil
    session[:pic_url] = nil
    redirect_to user_index_path
  end
end
