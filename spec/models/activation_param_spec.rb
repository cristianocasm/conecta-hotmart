require 'rails_helper'

RSpec.describe ActivationParam, :type => :model do
  it { should respond_to :value }
  it { should belong_to :activation_rule }
  it { should belong_to :api_param }
end
