class CreateActivationParams < ActiveRecord::Migration
  def change
    create_table :activation_params do |t|
      t.integer :api_param_id
      t.integer :activation_rule_id
      t.string :value

      t.timestamps
    end
    add_index :activation_params, :api_param_id
    add_index :activation_params, :activation_rule_id
  end
end
