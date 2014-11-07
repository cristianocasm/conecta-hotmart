class CreateHotmartNotifications < ActiveRecord::Migration
  def change
    create_table :hotmart_notifications do |t|
      t.string :hotmart_transaction
      t.string :phone_local_code
      t.string :phone_number
      t.string :prod_name
      t.string :status
      t.integer :user_id

      t.timestamps
    end
    add_index :hotmart_notifications, :user_id
  end

  def down
    drop_table :hotmart_notifications
  end
end
