class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.boolean :validated
      t.integer :user_id
      t.integer :api_id

      t.timestamps
    end
    add_index :api_keys, :user_id
    add_index :api_keys, :api_id
  end
end
