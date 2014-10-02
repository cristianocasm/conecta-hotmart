class AddTypeToApiKey < ActiveRecord::Migration
  def change
    add_column :api_keys, :type, :string
  end
end
