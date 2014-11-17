# == Schema Information
#
# Table name: api_methods
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  type        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe ApiMethod, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :type }
  it { should have_many(:mailchimp_actuation_rules) }
  it { should have_many(:arguments)}
  it { should have_many(:api_params).through(:arguments) }
end
