class AddCustomerEmailToHotmartNotification < ActiveRecord::Migration
  def change
    add_column :hotmart_notifications, :customer_email, :string
  end
end
