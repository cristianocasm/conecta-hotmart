require 'rails_helper'

RSpec.shared_examples 'ApiParamsHelper' do |api_name, api_param|
  describe 'path building' do
    it "should build 'index' path" do
      expect(script_api_path(api_name)).to eq("/#{api_name.underscore.pluralize}")
    end

    it "should build 'new' path" do
      expect(script_api_path(api_name, nil, :new)).to eq("/#{api_name.underscore.pluralize}/new")
    end

    it "should build 'show' path" do
      expect(script_api_path(api_name, api_param)).to eq("/#{api_name.underscore.pluralize}/#{api_param.id}")
    end

    it "should build 'edit' path" do
      expect(script_api_path(api_name, api_param, :edit)).to eq("/#{api_name.underscore.pluralize}/#{api_param.id}/edit")
    end
  end
end