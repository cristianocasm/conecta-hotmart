# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accepted_value do
    sequence(:name )  { Faker::Lorem.word }
    sequence(:description) { Faker::Lorem.sentence }
    api_param_id 1
  end
end
