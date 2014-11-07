require 'rails_helper'

RSpec.shared_examples 'ApisIntegration' do

  feature "User API dashboard" do
    scenario "User, with api keys, should be able to edit the Hotmart API Key" do
      expect(page.current_path).to eq edit_hotmart_api_key_path(user.hotmart_api_key.first.id)
    end

    scenario "User should be able to get his 'Notification URL Token'" do
      expect(page).to have_content(user.hotmart_token)
    end

    scenario "User should be able to access hotmart api" do
      expect(page).to have_link(I18n.t('api.integration'), href: edit_hotmart_api_key_path(user.hotmart_api_key.first.id))
    end

    feature "API keys section" do

      before(:each) {
        click_link I18n.t('api.integration')
      }

      scenario "User can't see 'checked' until Hotmart API key is validated" do
        click_link I18n.t('api.hotmart')
        expect(page).to have_no_selector('#validated')
      end

      scenario "User can't see 'checked' until Mailchimp API key is validated" do
        click_link I18n.t('api.mailchimp')
        expect(page).to have_no_selector('#validated')
      end

      scenario "User can't see 'checked' until Helpscout API key is validated" do
        click_link I18n.t('api.helpscout')
        expect(page).to have_no_selector('#validated')
      end

      feature "Update API Key" do

        let!(:key) { Faker::Lorem.characters(16) }

        scenario "User should be able to update his Hotmart API key" do
          click_link I18n.t('api.hotmart')
          fill_in I18n.t('api.key'), with: key
          click_button 'Update'
          expect(page).to have_content(I18n.t('api.key_updated', api_name: 'HotmartApiKey'))
        end

        scenario "User should be able to update his Mailchimp API key" do
          click_link I18n.t('api.mailchimp')
          fill_in I18n.t('api.key'), with: key
          click_button 'Update'
          expect(page).to have_content(I18n.t('api.key_updated', api_name: 'MailchimpApiKey'))
        end

        scenario "User should be able to update his Helpscout API key" do
          click_link I18n.t('api.helpscout')
          fill_in I18n.t('api.key'), with: key
          click_button 'Update'
          expect(page).to have_content(I18n.t('api.key_updated', api_name: 'HelpscoutApiKey'))
        end

        scenario "User should be able to get his 'Helpscout URL Notification'" do
          click_link I18n.t('api.helpscout')
          expect(page).to have_content(user.helpscout_token)
        end
      end

    end
  end
end