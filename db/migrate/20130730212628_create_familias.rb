class CreateFamilias < ActiveRecord::Migration
  def change
    create_table :familias do |t|
      t.string :nombre, limit: 80, null: false

    end
  end
end
