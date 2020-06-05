module ProfileHelper
  def isjoined(userid, groupid)
    result = Particpent.exists?(user_id: userid, group_id: groupid)
    return 'join' unless result

    'Leave'
  end

  def groupsmeb(group_id, t_id)
    result = Groupmember.exists?(group_id: group_id, transactin_id: t_id)
    return 'Join' unless result

    'Remove'
  end
  def img_link(tid)
    if Groupmember.exists?(transactin_id: tid)
      obj=Groupmember.where(transactin_id: tid).first
      grou=Group.where(id: obj.group_id).first
      return image_tag(url_for(grou.cover_pic), class: "img")
    else
      return 'no photo'
    end

  end
end
