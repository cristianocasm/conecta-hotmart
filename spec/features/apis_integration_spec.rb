require 'rails_helper'

RSpec.describe 'Integration with APIs', type: :feature do

  it_behaves_like 'ApisIntegration' do
    let(:user) {
      FactoryGirl.create(:client) do |client|
        client.api_keys << [ FactoryGirl.create(:hotmart_api_key),
                             FactoryGirl.create(:mailchimp_api_key),
                             FactoryGirl.create(:helpscout_api_key) ]
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
        admin.api_keys << [ FactoryGirl.create(:hotmart_api_key),
                            FactoryGirl.create(:mailchimp_api_key),
                            FactoryGirl.create(:helpscout_api_key) ]
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