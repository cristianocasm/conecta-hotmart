# == Schema Information
#
# Table name: data_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe DataType, :type => :model do
  it{ should respond_to :name }
  it{ should respond_to :description }
  it{ should have_many(:api_params) }
end
