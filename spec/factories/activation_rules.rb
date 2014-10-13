# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activation_rule do
    user_id 1
    name "MyString"
    description "MyString"
  end
end
