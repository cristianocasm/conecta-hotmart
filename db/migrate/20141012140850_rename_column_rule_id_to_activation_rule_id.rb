class RenameColumnRuleIdToActivationRuleId < ActiveRecord::Migration
  def change
    rename_column :notifications, :rule_id, :activation_rule_id
  end

  def down
    rename_column :notifications, :activation_rule_id, :rule_id
  end
end
