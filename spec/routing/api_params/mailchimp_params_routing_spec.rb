require 'rails_helper'

RSpec.describe "MailchimpParam's routes" do
  it_behaves_like 'ApiParamsRoute', 'MailchimpParam', FactoryGirl.create(:mailchimp_param)
end