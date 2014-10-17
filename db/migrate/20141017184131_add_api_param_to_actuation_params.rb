class AddApiParamToActuationParams < ActiveRecord::Migration
  def change
    add_reference :actuation_params, :api_param, index: true
  end
end
