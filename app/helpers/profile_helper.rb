module ProfileHelper
  def isjoined(userid, groupid)
    result = Particpent.exists?(user_id: userid, group_id: groupid)
    return 'join' unless result

    'Leave'
  end
end
