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

class Argument < ActiveRecord::Base
  belongs_to :api_param
  belongs_to :api_method

  has_many :actuation_params
  has_many :actuation_rules, through: :actuation_params

  def method_missing(sym, *args, &block)
    
  end
end
