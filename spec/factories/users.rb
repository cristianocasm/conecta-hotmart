# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client, :class => 'User' do
    name Faker::Name.name 
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
