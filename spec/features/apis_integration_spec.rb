require 'rails_helper'

RSpec.describe 'Integration with APIs', type: :feature do

  it_behaves_like 'ApisIntegration' do
    let(:user) {
      FactoryGirl.create(:client) do |client|
        client.hotmart_api_key.first.update_attributes(FactoryGirl.attributes_for(:hotmart_api_key))
        client.helpscout_api_key.first.update_attributes(FactoryGirl.attributes_for(:helpscout_api_key))
        client.mailchimp_api_key.first.update_attributes(FactoryGirl.attributes_for(:mailchimp_api_key))
      end
    }

    before(:each) {
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    }
  end

  it_behaves_like 'ApisIntegration' do
    let(:user) {
      FactoryGirl.create(:admin) do |admin|
        admin.hotmart_api_key.first.update_attributes(FactoryGirl.attributes_for(:hotmart_api_key))
        admin.helpscout_api_key.first.update_attributes(FactoryGirl.attributes_for(:helpscout_api_key))
        admin.mailchimp_api_key.first.update_attributes(FactoryGirl.attributes_for(:mailchimp_api_key))
      end
    }

    before(:each) {
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      click_link I18n.t('api.integration')
    }
  end

end