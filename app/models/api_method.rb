class ApiMethod < ActiveRecord::Base
  has_many :actuation_rules
  has_many :arguments
  has_many :api_params, through: :arguments
end
