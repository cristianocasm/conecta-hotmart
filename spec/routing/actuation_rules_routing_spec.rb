require "rails_helper"

RSpec.describe ActuationRulesController, :type => :routing do
  it_behaves_like 'ActuationRuleRoute', 'MailchimpActuationRule', FactoryGirl.create(:mailchimp_rule)
end
