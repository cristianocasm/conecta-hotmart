class CreateActuationRules < ActiveRecord::Migration
  def change
    create_table :actuation_rules do |t|
      t.integer :activation_rule_id
      t.integer :method_id
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :actuation_rules, :activation_rule_id
    add_index :actuation_rules, :method_id
  end
end
