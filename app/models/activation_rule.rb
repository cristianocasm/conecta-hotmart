class ActivationRule < ActiveRecord::Base
  belongs_to :user
  has_many :notifications
  has_many :actuation_rules

  has_many :activation_params
  has_many :api_params, :through => :activation_params
end
