# == Schema Information
#
# Table name: data_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_type do
    
    factory :string do
      name 'string'
      description 'string'
    end
    
    factory :boolean do
      name 'boolean'
      description 'boolean'
    end

  end
end
