# == Schema Information
#
# Table name: actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  method_id          :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'rails_helper'

RSpec.describe ActuationRule, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should belong_to :method }
  it { should belong_to :activation_rule }
  it { should have_many(:arguments).through(:actuation_params) }
end
