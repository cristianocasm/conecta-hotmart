class CreateRuleAssociations < ActiveRecord::Migration
  def change
    create_table :rule_associations do |t|
      t.integer :activation_rule_id
      t.integer :mailchimp_actuation_rule_id

      t.timestamps
    end
    add_index :rule_associations, :activation_rule_id
    add_index :rule_associations, :mailchimp_actuation_rule_id
  end
end
