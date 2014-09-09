require 'rails_helper'

RSpec.describe HotmartParam, :type => :model do
  it{ should respond_to :name }
  it{ should respond_to :description }
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :description }
  it{ should validate_uniqueness_of :name }
end
