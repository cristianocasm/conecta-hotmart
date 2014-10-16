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
  it { should have_many :activation_rules }

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

    it "should generate empty Hotmart Api Key" do
      user = FactoryGirl.create(:client)
      expect(user.hotmart_api_key.first.key).to eq ""
    end

    it "should generate empty Mailchimp Api Key" do
      user = FactoryGirl.create(:client)
      expect(user.mailchimp_api_key.first.key).to eq ""
    end

    it "should generate empty Helpscout Api Key" do
      user = FactoryGirl.create(:client)
      expect(user.helpscout_api_key.first.key).to eq ""
    end
  end

  describe "api key fetching" do

    let(:hotmart_api_key) { FactoryGirl.attributes_for(:hotmart_api_key) }
    let(:mailchimp_api_key) { FactoryGirl.attributes_for(:mailchimp_api_key) }
    let(:helpscout_api_key) { FactoryGirl.attributes_for(:helpscout_api_key) }
    
    let(:user) { FactoryGirl.create(:client) }
    
    it "should return user's hotmart api key" do
      user.hotmart_api_key.first.update_attribute(:key, hotmart_api_key[:key])
      key = user.hotmart_api_key.first.key
      expect(key).to eq hotmart_api_key[:key]
    end

    it "should return user's mailchimp api key" do
      user.mailchimp_api_key.first.update_attribute(:key, mailchimp_api_key[:key])
      key = user.mailchimp_api_key.first.key
      expect(key).to eq mailchimp_api_key[:key]
    end

    it "should return user's helpscout api key" do
      user.helpscout_api_key.first.update_attribute(:key, helpscout_api_key[:key])
      key = user.helpscout_api_key.first.key
      expect(key).to eq helpscout_api_key[:key]
    end
  end

  describe "User class and instance methods" do

    let(:hotmart_api_key) { FactoryGirl.attributes_for(:hotmart_api_key) }
    let(:client) { FactoryGirl.create(:client) }
    let(:admin) { FactoryGirl.create(:admin) }
    
    it "should find a user by token and hottok" do
      client.hotmart_api_key.first.update_attribute(:key, hotmart_api_key[:key])
      client_found = User.find_by_token_and_hottok(client.token, client.hotmart_api_key.first.key).first
      expect(client).to eq client_found
    end

    it "should check whether user is admin or not - testing a client" do
      expect(client.admin?).to eq false
    end

    it "should check whether user is admin or not - testing an admin" do
      expect(admin.admin?).to eq true
    end

  end

end
