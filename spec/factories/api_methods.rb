# == Schema Information
#
# Table name: api_methods
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  type        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_method do
    name "MyString"
    description "MyString"
    type ""
  end
end
