class RefactorAcceptedValuesTable < ActiveRecord::Migration
  def change
    remove_column :accepted_values, :name
    remove_column :accepted_values, :description
    add_column :accepted_values, :value, :string
  end
end
