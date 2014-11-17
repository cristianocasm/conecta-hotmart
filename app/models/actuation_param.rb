# == Schema Information
#
# Table name: actuation_params
#
#  id                          :integer          not null, primary key
#  mailchimp_actuation_rule_id :integer
#  argument_id                 :integer
#  value                       :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  api_param_id                :integer
#

class ActuationParam < ActiveRecord::Base
  belongs_to :mailchimp_actuation_rule
  belongs_to :argument
  
  belongs_to :hotmart_param, class_name: 'ApiParam', foreign_key: "hotmart_param_id"
  scope :hotmart_param, -> { joins(:api_params).where(type: 'HotmartParam') }
end
