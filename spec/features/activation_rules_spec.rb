require 'rails_helper'

RSpec.describe 'ActivationRules', type: :feature do
  
  let(:client) { FactoryGirl.create(:client) }

  before(:each){
    visit '/login'
    fill_in 'Email', with: client.email
    fill_in 'Password', with: client.password
    click_button 'Sign in'
  }

  feature "CRUD" do
    
    scenario "User should be able to access activation rule index" do
      expect(page).to have_link(I18n.t('api.rule.rules'), href: activation_rules_path)
    end

  end

end