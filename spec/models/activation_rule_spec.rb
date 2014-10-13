require 'rails_helper'

RSpec.describe ActivationRule, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should belong_to :user }
  it { should have_many :notifications }
  it { should have_many :actuation_rules }
  it { should have_many(:api_params).through(:activation_params) }
end
