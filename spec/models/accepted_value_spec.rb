require 'rails_helper'

RSpec.describe AcceptedValue, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should belong_to :api_param }
end
