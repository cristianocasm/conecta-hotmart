class AddShowInActivationRuleToApiParams < ActiveRecord::Migration
  def change
    add_column :api_params, :show_in_activation_rule, :boolean, :default => false
  end

  def down
    remove_column :api_params, :show_in_activation_rule
  end
end
