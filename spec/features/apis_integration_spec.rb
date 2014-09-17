require 'rails_helper'

RSpec.describe 'Integration with APIs', type: :feature do

  feature "API Keys dashboard" do

    let(:user) { FactoryGirl.create(:client) }

    before(:each) {
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      click_link I18n.t('api.integration')
    }

    scenario "User should be able to access the API Keys dashboard" do
      expect(page.current_path).to eq dashboard_api_keys_path
    end

    scenario "User should be able to get his 'Notification URL Token'" do
      click_link 'Hotmart'
      expect(page).to have_content(user.notification_url_token)
    end
  end
end