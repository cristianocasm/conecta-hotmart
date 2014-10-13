class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.integer :api_param_id
      t.integer :method_id
      t.integer :position
      t.boolean :required

      t.timestamps
    end
    add_index :arguments, :api_param_id
    add_index :arguments, :method_id
  end
end
