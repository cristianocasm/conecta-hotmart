class CreateAcceptedValues < ActiveRecord::Migration
  def change
    create_table :accepted_values do |t|
      t.string :name
      t.string :description
      t.integer :api_param_id

      t.timestamps
    end
    add_index :accepted_values, :api_param_id
  end
end
