# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_param do
    sequence(:name) { |i| "name#{i}" }
    description "description1"

    factory :mailchimp_param do
      type 'MailchimpParam'

      factory :mailchimp_param_invalid do
        name :nil
      end
    end

    factory :helpscout_param do
      type 'HelpscoutParam'

      factory :helpscout_param_invalid do
        name :nil
      end
    end

    factory :hotmart_param do
      type 'HotmartParam'

      factory :hotmart_param_invalid do
        name :nil
      end
    end

    factory :api_param_invalid do
      name :nil
    end
  end
end
