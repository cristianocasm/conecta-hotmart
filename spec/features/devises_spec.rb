require 'rails_helper'

RSpec.describe "Devise", :type => :feature do

  feature 'Login form' do

    feature 'as client' do

      it_behaves_like 'User', FactoryGirl.build(:client)

      let(:client) { FactoryGirl.create(:client) }

      before(:each){
        visit '/login'
        fill_in 'Email', with: client.email
        fill_in 'Password', with: client.password
        click_button 'Sign in'
      }

      scenario "Client logs in into system" do
        expect(page.current_path).to eq edit_api_key_path
      end

      scenario "Logged client is redirected to edit_api_key_path when trying to access '/login' page" do
        visit '/login'
        expect(page.current_path).to eq edit_api_key_path
      end

    end

    feature 'as admin' do

      it_behaves_like 'User', FactoryGirl.build(:admin)

      let(:admin) { FactoryGirl.create(:admin) }

      before(:each){
        visit '/login'
        fill_in 'Email', with: admin.email
        fill_in 'Password', with: admin.password
        click_button 'Sign in'
      }

      scenario "Admin logs in into system" do
        expect(page.current_path).to eq hotmart_params_path
      end

      scenario "Logged admin is redirected to hotmart_params_path when trying to access '/login' page" do
        visit '/login'
        expect(page.current_path).to eq hotmart_params_path
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

  scenario "User sees login form when accessing rooting page" do
    visit root_path
    expect(page).to have_content('Sign in')
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
