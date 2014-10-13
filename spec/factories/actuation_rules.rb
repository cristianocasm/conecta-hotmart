# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actuation_rule do
    activation_rule_id 1
    method_id 1
    name "MyString"
    description "MyString"
  end
end
