# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotmart_api, :class => 'Api' do
    name "hotmart"
    description "Hotmart"
  end

  factory :mailchimp_api, :class => 'Api' do
    name "mailchimp"
    description "Mailchimp"
  end

  factory :helpscout_api, :class => 'Api' do
    name "helpscout"
    description "Helpscout"
  end
end
