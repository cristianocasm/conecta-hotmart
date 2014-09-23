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
end
