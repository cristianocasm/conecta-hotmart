# == Schema Information
#
# Table name: actuation_params
#
#  id                :integer          not null, primary key
#  actuation_rule_id :integer
#  argument_id       :integer
#  value             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  api_param_id      :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actuation_param do
    actuation_rule_id 1
    argument_id 1
    api_param_id 1
    value "MyString"
  end
end
