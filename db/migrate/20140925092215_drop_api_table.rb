class DropApiTable < ActiveRecord::Migration
  def change
    drop_table :apis
  end
end
