class RemoveApiKeysFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :hotmart_token, :string
    remove_column :users, :mailchimp_api_key, :string
    remove_column :users, :helpscout_api_key, :string
  end
end
