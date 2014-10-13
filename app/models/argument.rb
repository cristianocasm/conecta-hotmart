class Argument < ActiveRecord::Base
  belongs_to :api_param
  belongs_to :method

  has_many :actuation_params
  has_many :actuation_rules, through: :actuation_params
end
