require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :token }
  it { should respond_to :hotmart_login }
  it { should respond_to :hotmart_access_token }
  it { should belong_to :user_type }
  it { should have_many :api_keys }
  it { should have_many :notifications }

  describe "before create" do

    it "should call #generate_url_token" do
      User.any_instance.stub(:generate_url_token)
      user = FactoryGirl.create(:client)
      expect(user).to have_received(:generate_url_token)
    end

    it "should generate notification url" do
      hash = Faker::Lorem.characters(16)
      User.any_instance.stub(:random_string).and_return(hash)
      user = FactoryGirl.create(:client)
      expect(user.token).to eq hash
    end
  end

  describe "api key fetching" do

    let(:hotmart_api_key) { FactoryGirl.create(:hotmart_api_key) }
    let(:mailchimp_api_key) { FactoryGirl.create(:mailchimp_api_key) }
    let(:helpscout_api_key) { FactoryGirl.create(:helpscout_api_key) }
    
    let(:user) { FactoryGirl.create(:client) do |client|
                   client.api_keys << [ hotmart_api_key,
                                        mailchimp_api_key,
                                        helpscout_api_key ]
                  end 
                }
    
    it "should return user's hotmart api key" do
      key = user.hotmart_api_key
      expect(key).to eq hotmart_api_key.key
    end

    it "should return user's mailchimp api key" do
      key = user.mailchimp_api_key
      expect(key).to eq mailchimp_api_key.key
    end

    it "should return user's helpscout api key" do
      key = user.helpscout_api_key
      expect(key).to eq helpscout_api_key.key
    end
  end
end
