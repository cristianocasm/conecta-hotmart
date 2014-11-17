class ChangeActuationRuleToMailchimpActuationRule < ActiveRecord::Migration
  def change
    rename_column :actuation_params, :actuation_rule_id, :mailchimp_actuation_rule_id
  end
end
