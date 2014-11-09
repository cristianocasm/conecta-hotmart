class HotmartNotification < ActiveRecord::Base
  scope :find_all_by_user_id,
          lambda { |user_id|
            where("user_id = #{user_id}").
            group(:prod_name).
            having('updated_at = MAX(updated_at)')
          }
end
