require 'rails_helper'

RSpec.describe RuleAssociation, :type => :model do
  it { should belong_to :activation_rule }
  it { should belong_to :mailchimp_actuation_rule }
  it { should validate_presence_of :activation_rule_id }
  it { should validate_presence_of :mailchimp_actuation_rule_id }
end
