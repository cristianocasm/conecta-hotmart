require 'rails_helper'

RSpec.describe 'ApiParams', type: :feature do
  it_behaves_like 'ApiParams', 'HotmartParam' do
    let(:api_obj) { FactoryGirl.create(:hotmart_param) }
  end
  
  it_behaves_like 'ApiParams', 'MailchimpParam' do
    let(:api_obj) { FactoryGirl.create(:mailchimp_param) }
  end
  
  it_behaves_like 'ApiParams', 'HelpscoutParam' do
    let(:api_obj) { FactoryGirl.create(:helpscout_param) }
  end
end