require 'rails_helper'

RSpec.describe ApiKey, :type => :model do
  it { should respond_to :key }
  it { should respond_to :validated? }
  it { should belong_to :user }
  it { should belong_to :api }

  let(:user) { FactoryGirl.create(:client) }
  
  xit "recovers only users' api keys" do
    api_keys = ApiKey.by_user(user)
    expect(api_keys).to eq user_api_keys
  end

  xit "don't recovers users' api keys" do
  end
end
