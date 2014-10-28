class RenameMethodIdToApiMethodId < ActiveRecord::Migration
  def change
    rename_column :arguments, :method_id, :api_method_id
  end
end
