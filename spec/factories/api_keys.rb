# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  validated  :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

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
