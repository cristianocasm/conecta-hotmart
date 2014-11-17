# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rule_association do
    activation_rule_id 1
    mailchimp_actuation_rule_id 1
  end
end
