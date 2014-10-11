class RemoveRequiredFromApiParams < ActiveRecord::Migration
  def change
    remove_column :api_params, :required
  end
end
