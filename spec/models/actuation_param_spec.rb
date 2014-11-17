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

require 'rails_helper'

RSpec.describe ActuationParam, :type => :model do
  it { should respond_to :value }
  it { should belong_to :mailchimp_actuation_rule }
  it { should belong_to :argument }
  it { should_not belong_to :api_param }
end
