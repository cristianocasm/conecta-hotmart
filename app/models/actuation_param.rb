# == Schema Information
#
# Table name: actuation_params
#
#  id                :integer          not null, primary key
#  actuation_rule_id :integer
#  argument_id       :integer
#  hotmart_param_id  :integer
#  value             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class ActuationParam < ActiveRecord::Base
  belongs_to :actuation_rule
  belongs_to :argument
  
  belongs_to :hotmart_param, class_name: 'ApiParam', foreign_key: "hotmart_param_id"
  scope :hotmart_param, -> { joins(:api_params).where(type: 'HotmartParam') }
end
