require 'rails_helper'

RSpec.shared_examples 'ActuationRuleRoute', type: :route do |rule_name, actuation_rule|
  describe "routing" do

    it "routes to #index" do
      expect(:get => script_api_path(rule_name)).to(
        route_to('actuation_rules#index', type: rule_name))
    end

    it "routes to #new" do
      expect(:get => script_api_path(rule_name, nil, :new)).to(
        route_to('actuation_rules#new', type: rule_name))
    end

    it "routes to #show" do
      expect(:get => script_api_path(rule_name, actuation_rule)).to(
        route_to('actuation_rules#show', type: rule_name, id: actuation_rule.id.to_s))
    end

    it "routes to #edit" do
      expect(:get => script_api_path(rule_name, actuation_rule, :edit)).to(
        route_to('actuation_rules#edit', type: rule_name, id: actuation_rule.id.to_s))
    end

    it "routes to #create" do
      expect(:post => script_api_path(rule_name)).to(
        route_to('actuation_rules#create', type: rule_name))
    end

    it "routes to #update" do
      expect(:put => script_api_path(rule_name, actuation_rule)).to(
        route_to('actuation_rules#update', type:rule_name, id: actuation_rule.id.to_s))
    end

    it "routes to #destroy" do
      expect(:delete => script_api_path(rule_name, actuation_rule)).to(
        route_to('actuation_rules#destroy', type: rule_name, id: actuation_rule.id.to_s))
    end

  end
end