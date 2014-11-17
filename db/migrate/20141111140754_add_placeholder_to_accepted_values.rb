class AddPlaceholderToAcceptedValues < ActiveRecord::Migration
  def change
    add_column :accepted_values, :placeholder, :string
  end
end
