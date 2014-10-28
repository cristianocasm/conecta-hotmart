class RenameColumnMethodIdToApiMethodId < ActiveRecord::Migration
  def change
    rename_column :actuation_rules, :method_id, :api_method_id
  end

  def down
    rename_column :actuation_rules, :api_method_id, :method_id
  end
end
