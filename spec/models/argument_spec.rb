# == Schema Information
#
# Table name: arguments
#
#  id           :integer          not null, primary key
#  api_param_id :integer
#  method_id    :integer
#  position     :integer
#  required     :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Argument, :type => :model do
  it { should respond_to :position }
  it { should respond_to :required }
  it { should belong_to :api_method }
  it { should belong_to :api_param }
  it { should have_many(:actuation_rules).through(:actuation_params) }
end
