class AddPlaceholderToActuationParams < ActiveRecord::Migration
  def change
    add_column :actuation_params, :placeholder, :string
  end
end
