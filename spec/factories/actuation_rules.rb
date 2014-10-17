# == Schema Information
#
# Table name: actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  method_id          :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  type               :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actuation_rule do
    sequence(:name) { Faker::Lorem.word }
    sequence(:description) { Faker::Lorem.sentence }
    
    factory :mailchimp_rule do
      type 'MailchimpActuationRule'
    end

    factory :helpscout_rule do
      type 'HelpscoutActuationRule'
    end
  end
end
