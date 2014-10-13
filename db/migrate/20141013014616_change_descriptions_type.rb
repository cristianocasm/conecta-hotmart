class ChangeDescriptionsType < ActiveRecord::Migration
  def change
    change_column :activation_rules, :description, :text
    change_column :actuation_rules, :description, :text
    change_column :api_params, :description, :text
    change_column :data_types, :description, :text
    change_column :user_types, :description, :text
  end
end
