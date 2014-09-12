require 'rails_helper'

RSpec.shared_examples 'ApiParam' do |api|
  let(:valid_attributes) {
    {
      name: 'name1',
      description: 'description1'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      description: 'description2'
    }
  }

  describe 'with valid attributes' do
    
  end
end