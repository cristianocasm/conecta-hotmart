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
