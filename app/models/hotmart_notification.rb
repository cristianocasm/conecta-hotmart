class HotmartNotification < ActiveRecord::Base

  def self.find_all_by_user(user_id)
    notifs = find_all_by_user_id(user_id)
    grouped_notifs = notifs.group_by { |notif| notif.user_id }
    grouped_notifs.try(:[],1)
  end

  private

  def find_all_by_user_id(user_id)
    self.where("user_id = #{user_id}")
  end
end