require "rails_helper"

RSpec.describe HotmartParamsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hotmart_params").to route_to("hotmart_params#index")
    end

    it "routes to #new" do
      expect(:get => "/hotmart_params/new").to route_to("hotmart_params#new")
    end

    it "routes to #show" do
      expect(:get => "/hotmart_params/1").to route_to("hotmart_params#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hotmart_params/1/edit").to route_to("hotmart_params#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hotmart_params").to route_to("hotmart_params#create")
    end

    it "routes to #update" do
      expect(:put => "/hotmart_params/1").to route_to("hotmart_params#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hotmart_params/1").to route_to("hotmart_params#destroy", :id => "1")
    end

  end
end
