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

class ApiMethod < ActiveRecord::Base
  has_many :mailchimp_actuation_rules
  has_many :arguments
  has_many :api_params, through: :arguments
end
