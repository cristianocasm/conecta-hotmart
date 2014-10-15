require "rails_helper"

RSpec.describe ActivationRulesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activation_rules").to route_to("activation_rules#index")
    end

    it "routes to #new" do
      expect(:get => "/activation_rules/new").to route_to("activation_rules#new")
    end

    it "routes to #show" do
      expect(:get => "/activation_rules/1").to route_to("activation_rules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activation_rules/1/edit").to route_to("activation_rules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/activation_rules").to route_to("activation_rules#create")
    end

    it "routes to #update" do
      expect(:put => "/activation_rules/1").to route_to("activation_rules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activation_rules/1").to route_to("activation_rules#destroy", :id => "1")
    end

  end
end
