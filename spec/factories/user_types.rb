# == Schema Information
#
# Table name: user_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

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
