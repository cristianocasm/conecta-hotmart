# == Schema Information
#
# Table name: activation_rules
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ActivationRule < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: :user_id
  
  belongs_to :user
  has_many :notifications
  has_many :rule_associations
  has_many :mailchimp_actuation_rules ,through: :rule_associations

  has_many :activation_params, dependent: :destroy
  has_many :api_params, :through => :activation_params
  accepts_nested_attributes_for :activation_params#, :reject_if => lambda { |c| c[:value].blank? }

  # Dentro do ActivationRule model
  def activated?(params)
    date_min = nil
    date_max = nil

    self.activation_params.each do |parametro|
      if(parametro.api_param.name == "purchase_date_start" && parametro.value.downcase.to_date)
        date_min = parametro.value.downcase.to_date
        return false if date_min > params[:purchase_date].to_date
      elsif(parametro.api_param.name == "purchase_date_end" && parametro.value.downcase.to_date)
        date_max = parametro.value.downcase.to_date
        return false if date_max < params[:purchase_date].to_date
      else
        return false unless parametro.value.downcase == params[parametro.api_param.name].try(:downcase) ||
                            parametro.value == "" # Garante que parâmetros não preenchidos sejam ignorados
      end
    end

    return true
  end

  def self.duplicate(id)
    attrs = self.find_by_id(id).attributes
    obj = self.new(attrs)
    obj.activation_params.each { |ap| ap.id = nil }
    obj
  end
end
