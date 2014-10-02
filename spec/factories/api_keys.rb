# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key do
    key Faker::Lorem.characters(32)
    #transient do
    #  validated false
    #end

    factory :hotmart_api_key do
      type 'HotmartApiKey'
    end

    factory :mailchimp_api_key do
      type 'MailchimpApiKey'
    end

    factory :helpscout_api_key do
      type 'HelpscoutApiKey'
    end
  end
end
