require 'rails_helper'

RSpec.describe ApiMethod, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :type }
  it { should have_many(:actuation_rules) }
  it { should have_many(:arguments)}
  it { should have_many(:api_params).through(:arguments) }
end
