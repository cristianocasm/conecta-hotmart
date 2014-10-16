# == Schema Information
#
# Table name: activation_params
#
#  id                 :integer          not null, primary key
#  api_param_id       :integer
#  activation_rule_id :integer
#  value              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class ActivationParam < ActiveRecord::Base
  belongs_to :activation_rule
  belongs_to :api_param
end
