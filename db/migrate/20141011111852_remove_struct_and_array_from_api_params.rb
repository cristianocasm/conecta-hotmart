class RemoveStructAndArrayFromApiParams < ActiveRecord::Migration
  def change
    remove_column :api_params, :struct
    remove_column :api_params, :array
  end
end
