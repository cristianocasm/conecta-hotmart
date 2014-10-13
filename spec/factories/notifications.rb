# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user_id 1
    activation_rule_id 1
    hotmart_notification "MyString"
    mailchimp_response "MyString"
    helpscout_response "MyString"
  end
end
