class HotmartNotification < ActiveRecord::Base

  scope :find_latest_notifications_per_product,
    lambda { |user_id|
      self.
        where("user_id = #{user_id}").
        order("updated_at DESC").
        group_by { |notif| notif.prod_name }.
        map { |prod, notif| notif[0] }
    }

end