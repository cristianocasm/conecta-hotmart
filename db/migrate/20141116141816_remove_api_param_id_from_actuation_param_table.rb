class RemoveApiParamIdFromActuationParamTable < ActiveRecord::Migration
  def change
    remove_column :actuation_params, :api_param_id
  end
end
