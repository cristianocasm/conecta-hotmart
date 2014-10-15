require 'rails_helper'

RSpec.describe "ApiParams' routes" do
  it_behaves_like 'ApiParamsRoute', 'HelpscoutParam', FactoryGirl.create(:helpscout_param)
  it_behaves_like 'ApiParamsRoute', 'HotmartParam', FactoryGirl.create(:hotmart_param)
  it_behaves_like 'ApiParamsRoute', 'MailchimpParam', FactoryGirl.create(:mailchimp_param)
end