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

require 'rails_helper'

RSpec.describe ActuationParam, :type => :model do
  it { should respond_to :value }
  it { should belong_to :actuation_rule }
  it { should belong_to :argument }
  it { should belong_to :hotmart_param }
end
