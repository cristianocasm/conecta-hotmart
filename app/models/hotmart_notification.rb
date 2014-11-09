class HotmartNotification < ActiveRecord::Base
  scope :find_all_by_user_id,
          lambda { |user_id|
            select(
              "hotmart_notifications.hotmart_transaction",
              "hotmart_notifications.phone_local_code",
              "hotmart_notifications.phone_number",
              "hotmart_notifications.prod_name",
              "hotmart_notifications.status",
              "hotmart_notifications.updated_at").
            where("user_id = #{user_id}").
            group(:prod_name).
            having('updated_at = MAX(updated_at)')
          }
end