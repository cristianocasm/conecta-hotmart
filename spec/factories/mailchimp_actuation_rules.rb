# == Schema Information
#
# Table name: mailchimp_actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  api_method_id      :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # factory :mailchimp_actuation_rule do
  #   sequence(:name) { Faker::Lorem.word }
  #   sequence(:description) { Faker::Lorem.sentence }
  # end
end
