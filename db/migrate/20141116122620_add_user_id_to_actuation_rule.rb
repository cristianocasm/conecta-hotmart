class AddUserIdToActuationRule < ActiveRecord::Migration
  def change
    add_column :actuation_rules, :user_id, :integer
    add_index :actuation_rules, :user_id
  end
end
