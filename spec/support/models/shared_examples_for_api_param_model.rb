require 'rails_helper'

RSpec.shared_examples 'ApiParam' do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :show_in_activation_rule }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :data_type_id }
  it { should validate_uniqueness_of :name }
  it { should belong_to :data_type }
  it { should have_many(:actuation_params) }
  it { should have_many(:arguments) }
end