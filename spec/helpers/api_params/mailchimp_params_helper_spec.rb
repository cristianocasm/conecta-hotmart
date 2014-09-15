require 'rails_helper'

RSpec.describe "MailchimpParam usage of ApiParam's helpers" do
  it_behaves_like 'ApiParamsHelper', 'MailchimpParam', FactoryGirl.create(:mailchimp_param)
end