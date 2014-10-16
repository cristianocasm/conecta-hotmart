# == Schema Information
#
# Table name: user_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class UserType < ActiveRecord::Base
  has_many :users
end
