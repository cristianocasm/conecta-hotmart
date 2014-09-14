require 'rails_helper'

RSpec.shared_examples 'ApiParamsRoute', type: :route do |api_name, api_param|
  describe "routing" do

    it "routes to #index" do
      expect(:get => script_api_path(api_name)).to(
        route_to('api_params#index', type: api_name))
    end

    it "routes to #new" do
      expect(:get => script_api_path(api_name, nil, :new)).to(
        route_to('api_params#new', type: api_name))
    end

    it "routes to #show" do
      expect(:get => script_api_path(api_name, api_param)).to(
        route_to('api_params#show', type: api_name, id: api_param.id.to_s))
    end

    it "routes to #edit" do
      expect(:get => script_api_path(api_name, api_param, :edit)).to(
        route_to('api_params#edit', type: api_name, id: api_param.id.to_s))
    end

    it "routes to #create" do
      expect(:post => script_api_path(api_name)).to(
        route_to('api_params#create', type: api_name))
    end

    it "routes to #update" do
      expect(:put => script_api_path(api_name, api_param)).to(
        route_to('api_params#update', type:api_name, id: api_param.id.to_s))
    end

    it "routes to #destroy" do
      expect(:delete => script_api_path(api_name, api_param)).to(
        route_to('api_params#destroy', type: api_name, id: api_param.id.to_s))
    end

  end
end