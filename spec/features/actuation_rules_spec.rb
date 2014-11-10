require 'rails_helper'

RSpec.describe "ActuationRules", type: :feature do
  feature "CRUD" do

    let(:client) { FactoryGirl.create(:client) }
    # let(:actuation_rule) { FactoryGirl.create(:actuation_rule) }

    before(:each){
      visit '/login'
      fill_in 'Email', with: client.email
      fill_in 'Password', with: client.password
      click_button 'Sign in'
    }

    scenario "User should be able to access mailchimp actuation rule index" do
      click_link I18n.t('api.rule.mailchimp_actuation_rules')
      expect(page).to have_content(I18n.t('.title', :default => MailchimpActuationRule.model_name.human.pluralize.titleize))
    end
  end
end