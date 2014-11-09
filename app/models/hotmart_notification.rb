class HotmartNotification < ActiveRecord::Base

  scope :find_latest_notifications_per_product,
    lambda { |user_id, customer_email|
      self.
        where("user_id = #{user_id} AND customer_email = #{customer_email}").
        order("updated_at DESC").
        group_by { |notif| notif.prod_name }.
        map { |prod, notif| notif[0] }
    }

end