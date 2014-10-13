# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :argument do
    api_param_id 1
    method_id 1
    position 1
    required false
  end
end
