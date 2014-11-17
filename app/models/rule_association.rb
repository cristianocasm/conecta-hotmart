class RuleAssociation < ActiveRecord::Base
  validates_presence_of :activation_rule_id, :mailchimp_actuation_rule_id

  belongs_to :mailchimp_actuation_rule
  belongs_to :activation_rule

  # scope :get_all_by_user_id,
  #       lambda { |user_id|
  #         joins(:mailchimp_actuation_rule).
  #         joins(:activation_rule).
  #         where('activation_rules.user_id = ? AND rule_associations.mailchimp_actuation_rule_id IS NOT NULL', user_id)
  #       }
end
