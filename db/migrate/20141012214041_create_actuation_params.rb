class CreateActuationParams < ActiveRecord::Migration
  def change
    create_table :actuation_params do |t|
      t.integer :actuation_rule_id
      t.integer :argument_id
      t.integer :hotmart_param_id
      t.string :value

      t.timestamps
    end
    add_index :actuation_params, :actuation_rule_id
    add_index :actuation_params, :argument_id
    add_index :actuation_params, :hotmart_param_id
  end
end
