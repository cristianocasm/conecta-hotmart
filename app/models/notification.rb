# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  activation_rule_id   :integer
#  hotmart_notification :string(255)
#  mailchimp_response   :string(255)
#  helpscout_response   :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :activation_rule
end
