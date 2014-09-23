# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_type, :class => 'UserType' do
    name "admin"
    description "Admin"
  end

  factory :client_type, :class => 'UserType' do
    name "client"
    description "Client"
  end
end
