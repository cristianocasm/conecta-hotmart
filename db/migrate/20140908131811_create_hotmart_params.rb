class CreateHotmartParams < ActiveRecord::Migration
  def change
    create_table :hotmart_params do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
