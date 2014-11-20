# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  activation_rule_id   :integer
#  hotmart_notification :string(255)
#  mailchimp_response   :string(255)
#  helpscout_response   :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user_id 1
    activation_rule_id 1
    hotmart_notification_id 1
    mailchimp_response "MyString"
  end
end
