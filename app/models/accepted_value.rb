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

class AcceptedValue < ActiveRecord::Base
  belongs_to :api_param
end
