# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client, :class => 'User' do
    name Faker::Name.name 
    email Faker::Internet.email
    password Faker::Internet.password
    association :user_type, factory: :client_type
    after(:create) do |user, evaluator|
      create_list(:api_key, 3, user: user)
    end

    factory :admin do
      association :user_type, factory: :admin_type
    end
  end
end
