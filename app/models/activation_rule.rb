class ActivationRule < ActiveRecord::Base
  validates_presence_of :name, :description
  
  belongs_to :user
  has_many :notifications
  has_many :actuation_rules, dependent: :destroy

  has_many :activation_params, dependent: :destroy
  has_many :api_params, :through => :activation_params
  accepts_nested_attributes_for :activation_params, :reject_if => lambda { |c| c[:value].blank? }
end
