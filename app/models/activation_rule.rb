class ActivationRule < ActiveRecord::Base
  validates_presence_of :name, :description
  
  belongs_to :user
  has_many :notifications
  has_many :actuation_rules, dependent: :destroy

  has_many :activation_params, dependent: :destroy
  has_many :api_params, :through => :activation_params
  accepts_nested_attributes_for :activation_params, :reject_if => lambda { |c| c[:value].blank? }

  # Dentro do ActivationRule model
  def activated?(params)
    self.activation_params.each do |parametro|
      return false unless parametro.value == params[parametro.api_param.name]
    end

    return true
  end
end
