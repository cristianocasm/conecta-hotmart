# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key do
    sequence(:key) { |i| %w(hotmart_key mailchimp_key helpscout_key)[i] }
    validated false
    api_id 1
  end
end
