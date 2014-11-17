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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # factory :hotmart_notification do
  #   transaction "MyString"
  #   phone_local_code "MyString"
  #   phone_number "MyString"
  #   prod_name "MyString"
  #   status "MyString"
  #   user_id 1
  # end
end
