module Account::GroupHelper
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
end
