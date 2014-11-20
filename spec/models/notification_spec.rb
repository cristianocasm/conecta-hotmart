# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  activation_rule_id   :integer
#  hotmart_notification :string(255)
#  mailchimp_response   :string(255)
#  helpscout_response   :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

require 'rails_helper'

RSpec.describe Notification, :type => :model do
  it { should_not respond_to :helpscout_response }
  it { should respond_to :mailchimp_response }
  it { should belong_to :user }
  it { should belong_to :activation_rule }
  it { should belong_to :hotmart_notification }
end
