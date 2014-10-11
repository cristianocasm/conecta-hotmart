class AddDataTypeIdToApiParams < ActiveRecord::Migration
  def change
    add_column :api_params, :data_type_id, :integer
    add_index :api_params, :data_type_id
  end
end
