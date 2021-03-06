# == Schema Information
#
# Table name: hotmart_notifications
#
#  id                     :integer          not null, primary key
#  hotmart_transaction    :string(255)
#  phone_local_code       :string(255)
#  phone_number           :string(255)
#  prod_name              :string(255)
#  status                 :string(255)
#  user_id                :integer
#  created_at             :datetime
#  updated_at             :datetime
#  customer_email         :string(255)
#  hottok                 :string(255)
#  prod                   :string(255)
#  off                    :string(255)
#  price                  :string(255)
#  aff                    :string(255)
#  aff_name               :string(255)
#  name                   :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  doc                    :string(255)
#  address                :string(255)
#  address_number         :string(255)
#  address_country        :string(255)
#  address_district       :string(255)
#  address_comp           :string(255)
#  address_city           :string(255)
#  address_state          :string(255)
#  address_zip_code       :string(255)
#  xcod                   :string(255)
#  src                    :string(255)
#  payment_engine         :string(255)
#  payment_type           :string(255)
#  hotkey                 :string(255)
#  name_subscription_plan :string(255)
#  subscriber_code        :string(255)
#  cms_marketplace        :string(255)
#  cms_vendor             :string(255)
#  cms_aff                :string(255)
#  callback_type          :string(255)
#  subscription_status    :string(255)
#  transaction_ext        :string(255)
#  sck                    :string(255)
#  purchase_date          :string(255)
#

class HotmartNotification < ActiveRecord::Base

  belongs_to :user
  has_one :notification

  scope :find_latest_notifications_per_product,
    lambda { |user_id, customer_email|
      self.
        where("user_id = #{user_id} AND customer_email = '#{customer_email}'").
        order("updated_at DESC").
        group_by { |notif| notif.hotmart_transaction }.
        map { |trans, notif| notif[0] }
    }

end
