class ActuationRule < ActiveRecord::Base
  belongs_to :activation_rule
  belongs_to :method

  has_many :actuation_params
  has_many :arguments, through: :actuation_params
end
