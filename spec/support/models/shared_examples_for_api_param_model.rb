require 'rails_helper'

RSpec.shared_examples 'ApiParam' do
  it{ should respond_to :name }
  it{ should respond_to :description }
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :description }
  it{ should validate_uniqueness_of :name }
  it{ should belong_to :data_type }
  # it{ should have_many(:parent_params).through(:parent_api_params) }
  # it{ should have_many(:child_params).through(:nested_params) }
end