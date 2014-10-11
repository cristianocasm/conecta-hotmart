class DropNestedParamsTable < ActiveRecord::Migration
  def change
    drop_table :nested_params
  end
end
