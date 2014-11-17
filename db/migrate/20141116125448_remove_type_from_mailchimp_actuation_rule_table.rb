class RemoveTypeFromMailchimpActuationRuleTable < ActiveRecord::Migration
  def change
    remove_column :mailchimp_actuation_rules, :type
  end
end
