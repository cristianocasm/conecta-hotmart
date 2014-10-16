# == Schema Information
#
# Table name: activation_params
#
#  id                 :integer          not null, primary key
#  api_param_id       :integer
#  activation_rule_id :integer
#  value              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activation_param do
    api_param_id 1
    activation_rule_id 1
    value "MyString"
  end
end
