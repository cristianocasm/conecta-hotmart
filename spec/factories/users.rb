# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client, :class => 'User' do
    name Faker::Name.name 
    email Faker::Internet.email
    password Faker::Internet.password
    after(:create) do |user, evaluator|
      create_list(:api_key, 3, user: user)
    end
  end
end
