require 'rails_helper'

RSpec.configure do |c|
  c.alias_it_behaves_like_to :it_has_behavior, 'has behavior:'
end

RSpec.describe ApiParamsHelper, :type => :helper do
  it_has_behavior 'ApiParamsHelper', 'MailchimpParam', FactoryGirl.create(:mailchimp_param)
  it_has_behavior 'ApiParamsHelper', 'HelpscoutParam', FactoryGirl.create(:helpscout_param)
  it_has_behavior 'ApiParamsHelper', 'HotmartParam', FactoryGirl.create(:hotmart_param)
end
