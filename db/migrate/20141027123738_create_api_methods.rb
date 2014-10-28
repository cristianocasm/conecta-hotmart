class CreateApiMethods < ActiveRecord::Migration
  def change
    create_table :api_methods do |t|
      t.string :name
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
