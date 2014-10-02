class RemoveApiIdFromApiKeys < ActiveRecord::Migration
  def change
    remove_column :api_keys, :api_id
  end
end
