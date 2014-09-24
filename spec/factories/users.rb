# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Name.name 
    email Faker::Internet.email
    password Faker::Internet.password

    factory :admin do
      association :user_type, factory: :admin_type
    end

    factory :client do
      association :user_type, factory: :client_type
    end
  end
end
