# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accepted_value do
    sequence(:value)  { Faker::Lorem.word }
  end
end
