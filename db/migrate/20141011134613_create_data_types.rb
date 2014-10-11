class CreateDataTypes < ActiveRecord::Migration
  def change
    create_table :data_types do |t|
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end

  def down
    drop_table :data_type
  end
end
