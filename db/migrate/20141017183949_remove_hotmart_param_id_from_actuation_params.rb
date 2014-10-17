class RemoveHotmartParamIdFromActuationParams < ActiveRecord::Migration
  def change
    remove_column :actuation_params, :hotmart_param_id
  end
end
