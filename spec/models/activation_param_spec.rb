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

require 'rails_helper'

RSpec.describe ActivationParam, :type => :model do
  it { should respond_to :value }
  it { should belong_to :activation_rule }
  it { should belong_to :api_param }
end
