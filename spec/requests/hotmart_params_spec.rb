require 'rails_helper'

RSpec.describe "HotmartParams", :type => :request do
  describe "GET /hotmart_params" do
    it "works! (now write some real specs)" do
      get hotmart_params_path
      expect(response.status).to be(200)
    end
  end
end
