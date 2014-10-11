require 'rails_helper'

RSpec.shared_examples 'ApiParams' do |api_name, api_param|

  let(:user) { FactoryGirl.create(:admin) }
  
  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
  
  feature "ApiParam create form" do

    scenario "User should be able to define the ApiParam name" do
      visit script_api_path(api_name, nil, :new)
      expect(page).to have_field(api_name.underscore + '[name]')
    end

    scenario "User should be able to define the ApiParam description" do
      visit script_api_path(api_name, nil, :new)
      expect(page).to have_field(api_name.underscore + '[description]')
    end

    scenario "User should be able to define the ApiParam data type" do
      visit script_api_path(api_name, nil, :new)
      expect(page).to have_select(api_name.underscore + '[data_type_id]')
    end
  end

  feature "ApiParam show screen" do

    before(:each) { visit script_api_path(api_name, api_obj) }

    scenario "User should be able to see api param's name on show screen" do
      expect(page).to have_content(api_obj.name)
    end

    scenario "User should be able to see api param's description on show screen" do
      expect(page).to have_content(api_obj.description)
    end

    scenario "User should be able to see api param's data type name on show screen" do
      expect(page).to have_content(api_obj.data_type.name)
    end

  end

  feature "ApiParam edit screen" do

    before(:each) { visit script_api_path(api_name, api_obj, :edit) }

    scenario "User should be able to see api param's name on edit screen" do
      expect(page).to have_field(api_name.underscore + '[name]', with: api_obj.name)
    end

    scenario "User should be able to see api param's description on edit screen" do
      expect(page).to have_field(api_name.underscore + '[description]', with: api_obj.description)
    end

    scenario "User should be able to see api param's data type name on edit screen" do
      expect(page).to have_select(api_name.underscore + '[data_type_id]', selected: api_obj.data_type.name)
    end

  end
end