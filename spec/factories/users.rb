# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  hotmart_token          :string(255)
#  hotmart_login          :string(255)
#  hotmart_access_token   :string(255)
#  role_id                :integer
#  created_at             :datetime
#  updated_at             :datetime
#  user_type_id           :integer
#  helpscout_token        :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Name.name 
    sequence(:email) { Faker::Internet.email }
    password Faker::Internet.password
    hotmart_token Faker::Lorem.characters(32)
    helpscout_token Faker::Lorem.characters(32)

    factory :admin do
      association :user_type, factory: :admin_type
      before(:create) { |user| user.class.skip_callback(:create, :before, :set_as_non_admin) }
    end

    factory :client do
      association :user_type, factory: :client_type
    end
  end
end
