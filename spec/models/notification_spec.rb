require 'rails_helper'

RSpec.describe Notification, :type => :model do
  it { should respond_to :hotmart_notification }
  it { should respond_to :mailchimp_response }
  it { should respond_to :helpscout_response }
  it { should belong_to :user }
  # it { should belong_to :rule }
end
