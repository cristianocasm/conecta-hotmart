require 'rails_helper'

RSpec.describe 'ActivationRules', type: :feature do
  
  let(:client) { FactoryGirl.create(:client) }
  let(:activation_rule) { FactoryGirl.create(:activation_rule) }

  before(:each){
    visit '/login'
    fill_in 'Email', with: client.email
    fill_in 'Password', with: client.password
    click_button 'Entrar'
  }

  feature "CRUD" do
    
    scenario "User should be able to access activation rule index" do
      expect(page).to have_link(I18n.t('api.rule.rules'), href: activation_rules_path)
    end

    scenario "User should be able to access activation rule new" do
      click_link I18n.t('api.rule.rules')
      expect(page).to have_link(I18n.t("helpers.links.new"), href: new_activation_rule_path)
    end

    scenario "User should be able to access activation rule edit" do
      activation_rule
      
      click_link I18n.t('api.rule.rules')
      click_link I18n.t("helpers.links.edit")
      expect(page).to have_field('activation_rule_name', with: activation_rule.name)
    end

  end

end