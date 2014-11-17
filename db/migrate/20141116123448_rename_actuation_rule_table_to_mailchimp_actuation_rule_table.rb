class RenameActuationRuleTableToMailchimpActuationRuleTable < ActiveRecord::Migration
  def change
    rename_table :actuation_rules, :mailchimp_actuation_rules
  end
end
