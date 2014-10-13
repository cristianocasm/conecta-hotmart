class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :activation_rule
end
