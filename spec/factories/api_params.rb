# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_param do
    name "MyString"
    description "MyString"
    type ""
    required false
  end
end
