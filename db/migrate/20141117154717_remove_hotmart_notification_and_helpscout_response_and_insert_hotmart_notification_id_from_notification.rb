class RemoveHotmartNotificationAndHelpscoutResponseAndInsertHotmartNotificationIdFromNotification < ActiveRecord::Migration
  def change
    remove_column :notifications, :hotmart_notification
    remove_column :notifications, :helpscout_response
    add_column :notifications, :hotmart_notification_id, :integer
    add_index :notifications, :hotmart_notification_id
  end
end
