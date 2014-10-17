# == Schema Information
#
# Table name: actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  method_id          :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  type               :string(255)
#

class MailchimpActuationRule < ActuationRule
end
