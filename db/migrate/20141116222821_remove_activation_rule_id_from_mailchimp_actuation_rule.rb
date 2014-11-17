class RemoveActivationRuleIdFromMailchimpActuationRule < ActiveRecord::Migration
  def change
    remove_column :mailchimp_actuation_rules, :activation_rule_id
  end
end
