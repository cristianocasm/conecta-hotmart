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

class DataType < ActiveRecord::Base
  has_many :api_params
end
