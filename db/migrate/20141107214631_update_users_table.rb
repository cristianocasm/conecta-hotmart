class UpdateUsersTable < ActiveRecord::Migration
  def change
    rename_column :users, :token, :hotmart_token
    add_column :users, :helpscout_token, :string
  end

  def down
    rename_column :users, :hotmart_token, :token
    remove_column :users, :helpscout_token
  end
end
