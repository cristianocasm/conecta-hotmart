require "rails_helper"

RSpec.describe ActuationRulesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/actuation_rules").to route_to("actuation_rules#index")
    end

    it "routes to #new" do
      expect(:get => "/actuation_rules/new").to route_to("actuation_rules#new")
    end

    it "routes to #show" do
      expect(:get => "/actuation_rules/1").to route_to("actuation_rules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/actuation_rules/1/edit").to route_to("actuation_rules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/actuation_rules").to route_to("actuation_rules#create")
    end

    it "routes to #update" do
      expect(:put => "/actuation_rules/1").to route_to("actuation_rules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/actuation_rules/1").to route_to("actuation_rules#destroy", :id => "1")
    end

  end
end
