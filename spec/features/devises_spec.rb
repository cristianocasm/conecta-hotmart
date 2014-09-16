require 'rails_helper'

RSpec.describe "Devise", :type => :feature do

  let(:user) { FactoryGirl.create(:client) }

  feature 'Login form' do

    before(:each){
      visit '/login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    }

    scenario "User logs in into system" do
      expect(page.current_path).to eq hotmart_params_path
    end

    scenario "Logged user is redirected to hotmart_params_path when trying to access '/login' page" do
      visit '/login'
      expect(page.current_path).to eq hotmart_params_path
    end

    feature 'Logout link' do

      before(:each){
        click_link user.name
        click_link 'Logout'
      }

      scenario "User is redirected to '/login' page when logged out" do
        expect(page.current_path).to eq new_user_session_path
      end

      scenario "Non-logged-in user is redirected to '/login' form" do
        visit hotmart_params_path
        expect(page.current_path).to eq new_user_session_path
      end

    end
    
  end

  feature "Forgot password form" do
    scenario "User is able to recover its password" do
      visit '/login'
      click_link 'Forgot password?'
      expect(page.current_path).to eq new_user_password_path
    end
  end

  scenario "returns 404 when trying to access '/users/sign_in' route" do
    visit '/users/sign_in'
    expect(page.status_code).to eq 404
  end

  scenario "visitants can't signup into the system" do
    visit '/users/sign_up'
    expect(page.status_code).to eq 404
  end

end
