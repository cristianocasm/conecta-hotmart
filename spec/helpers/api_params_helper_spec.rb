require 'rails_helper'

RSpec.describe "ApiParams' helpers" do
  it_behaves_like 'ApiParamsHelper', 'HelpscoutParam', FactoryGirl.create(:helpscout_param)
  it_behaves_like 'ApiParamsHelper', 'HotmartParam', FactoryGirl.create(:hotmart_param)
  it_behaves_like 'ApiParamsHelper', 'MailchimpParam', FactoryGirl.create(:mailchimp_param)
end