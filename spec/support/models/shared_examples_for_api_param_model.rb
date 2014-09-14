require 'rails_helper'

RSpec.shared_examples 'ApiParam' do
  it{ should respond_to :name }
  it{ should respond_to :description }
  it{ should respond_to :required }
  it{ should respond_to :struct }
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :description }
  it{ should validate_uniqueness_of :name }
  it{ should have_many(:parent_params).through(:parent_api_params) }
  it{ should have_many(:child_params).through(:nested_params) }

  describe 'when creating with valid attributes' do
    let(:apiObj){ FactoryGirl.create(:api_param) }

    it 'should have #required true' do
      expect(apiObj.required).to eq true
    end

    it 'should have #struct false' do
      expect(apiObj.struct).to eq false
    end
  end
end