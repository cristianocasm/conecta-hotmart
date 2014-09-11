# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accepted_value do
    name "MyString"
    description "MyString"
    api_param_id 1
  end
end
