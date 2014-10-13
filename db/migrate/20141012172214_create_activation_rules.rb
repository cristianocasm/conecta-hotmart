class CreateActivationRules < ActiveRecord::Migration
  def change
    create_table :activation_rules do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :activation_rules, :user_id
  end
end
