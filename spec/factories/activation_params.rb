# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activation_param do
    api_param_id 1
    activation_rule_id 1
    value "MyString"
  end
end
