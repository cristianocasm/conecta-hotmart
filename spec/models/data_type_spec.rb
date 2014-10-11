require 'rails_helper'

RSpec.describe DataType, :type => :model do
  it{ should respond_to :name }
  it{ should respond_to :description }
  it{ should have_many(:api_params) }
end
