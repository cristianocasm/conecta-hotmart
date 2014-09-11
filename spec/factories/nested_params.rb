# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nested_param do
    parent_param_id 1
    child_param_id 1
    required false
  end
end
