class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :rule_id
      t.string :hotmart_notification
      t.string :mailchimp_response
      t.string :helpscout_response

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :rule_id
  end
end
