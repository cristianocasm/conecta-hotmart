# == Schema Information
#
# Table name: accepted_values
#
#  id           :integer          not null, primary key
#  api_param_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  value        :string(255)
#  placeholder  :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accepted_value do
    sequence(:value)  { Faker::Lorem.word }
  end
end
