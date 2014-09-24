# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key do
    key Faker::Lorem.characters(32)
    #transient do
    #  validated false
    #end

    factory :hotmart_api_key do
      association :api, factory: :hotmart_api
    end

    factory :mailchimp_api_key do
      association :api, factory: :mailchimp_api
    end

    factory :helpscout_api_key do
      association :api, factory: :helpscout_api
    end
  end
end
