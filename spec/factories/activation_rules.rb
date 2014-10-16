# == Schema Information
#
# Table name: activation_rules
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activation_rule do
    user_id 1
    name "Activation Rule"
    description "An Activation Rule"
  end
end
