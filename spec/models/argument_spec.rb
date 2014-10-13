require 'rails_helper'

RSpec.describe Argument, :type => :model do
  it { should respond_to :position }
  it { should respond_to :required }
  it { should belong_to :method }
  it { should belong_to :api_param }
  it { should have_many(:actuation_rules).through(:actuation_params) }
end
