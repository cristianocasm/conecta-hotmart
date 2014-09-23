class ChangeNotificationUrlTokenToToken < ActiveRecord::Migration
  def change
    rename_column :users, :notification_url_token, :token
  end
end
