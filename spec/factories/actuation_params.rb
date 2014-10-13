# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actuation_param do
    actuation_rule_id 1
    argument_id 1
    hotmart_param_id 1
    value "MyString"
  end
end
