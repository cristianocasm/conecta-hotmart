require 'rails_helper'

RSpec.describe ActuationParam, :type => :model do
  it { should respond_to :value }
  it { should belong_to :actuation_rule }
  it { should belong_to :argument }
  it { should belong_to :hotmart_param }
end
