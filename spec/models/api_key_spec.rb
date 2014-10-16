# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  validated  :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

require 'rails_helper'

RSpec.describe ApiKey, :type => :model do
  it { should respond_to :key }
  it { should respond_to :validated? }
  it { should belong_to :user }

  let(:user) { FactoryGirl.create(:client) }
  
  xit "recovers only users' api keys" do
    api_keys = ApiKey.by_user(user)
    expect(api_keys).to eq user_api_keys
  end

  xit "don't recovers users' api keys" do
  end
end
