require 'rails_helper'

RSpec.describe ActuationRule, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should belong_to :method }
  it { should belong_to :activation_rule }
  it { should have_many(:arguments).through(:actuation_params) }
end
