require 'rails_helper'

RSpec.shared_examples 'User' do |user|
  
  feature 'Logout link' do

    before(:each){
      click_link user.name
      click_link 'Logout'
    }

    scenario "User is redirected to '/login' page when logged out" do
      expect(page.current_path).to eq new_user_session_path
    end

    xscenario "Non-logged-in user is redirected to '/login' form" do
      visit edit_hotmart_api_key_path(user.hotmart_api_key.first.id)
      expect(page.current_path).to eq new_user_session_path
    end

  end

end