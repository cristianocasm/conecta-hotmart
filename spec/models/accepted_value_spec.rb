# == Schema Information
#
# Table name: accepted_values
#
#  id           :integer          not null, primary key
#  api_param_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  value        :string(255)
#  placeholder  :string(255)
#

require 'rails_helper'

RSpec.describe AcceptedValue, :type => :model do
  it { should respond_to :value }
  it { should belong_to :api_param }
end
