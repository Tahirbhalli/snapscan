module Account::TransactionsHelper
  def img_link(tid)
    if Groupmember.exists?(transactin_id: tid)
      obj = Groupmember.where(transactin_id: tid).first
      grou = Group.where(id: obj.group_id).first
      image_tag(url_for(grou.cover_pic), class: 'img')
    else
      link_to 'Join Group', join_account_profile_transactions_path(session[:current_user],
                                                                   t_id: tid), class: 'text-body badge btn btn-success'
    end
  end
end
