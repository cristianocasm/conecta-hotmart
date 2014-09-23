require 'rails_helper'

RSpec.describe 'Integration with APIs', type: :feature do

  feature "Client API Keys dashboard" do

    let(:client) { FactoryGirl.create(:client) }

    before(:each) {
      visit root_path
      fill_in 'Email', with: client.email
      fill_in 'Password', with: client.password
      click_button 'Sign in'
    }

    scenario "Client should be able to access the API Keys dashboard" do
      expect(page.current_path).to eq edit_api_key_path
    end

    scenario "Client should be able to get his 'Notification URL Token'" do
      expect(page).to have_content(client.token)
    end
  end

  feature "Admin API Keys dashboard" do

    let(:admin) { FactoryGirl.create(:admin) }

    before(:each) {
      visit root_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
      click_link I18n.t('api.integration')
    }

    scenario "Admin should be able to access the API Keys dashboard" do
      expect(page.current_path).to eq edit_api_key_path
    end

    scenario "Admin should be able to get his 'Notification URL Token'" do
      expect(page).to have_content(admin.token)
    end
  end
end