class CreateNestedParams < ActiveRecord::Migration
  def change
    create_table :nested_params do |t|
      t.integer :api_param_id
      t.integer :child_param_id
      t.boolean :required

      t.timestamps
    end
    add_index :nested_params, :api_param_id
    add_index :nested_params, :child_param_id
  end
end
