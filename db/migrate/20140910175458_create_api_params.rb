class CreateApiParams < ActiveRecord::Migration
  def change
    create_table :api_params do |t|
      t.string :name
      t.string :description
      t.boolean :required, default: true
      t.boolean :struct, default: false
      t.boolean :array, default: false
      t.string :type

      t.timestamps
    end
  end
end
