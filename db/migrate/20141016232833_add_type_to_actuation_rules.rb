class AddTypeToActuationRules < ActiveRecord::Migration
  def change
    add_column :actuation_rules, :type, :string
  end
end
