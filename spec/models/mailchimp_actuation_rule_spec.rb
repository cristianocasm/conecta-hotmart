# == Schema Information
#
# Table name: mailchimp_actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  api_method_id      :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#

require 'rails_helper'

RSpec.describe MailchimpActuationRule, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should belong_to :api_method }
  it { should_not belong_to :activation_rule }
  it { should belong_to :user }
  it { should have_many(:arguments).through(:actuation_params) }
  it { should have_many :rule_associations }
  it { should have_many(:activation_rules).through(:rule_associations) }
end
