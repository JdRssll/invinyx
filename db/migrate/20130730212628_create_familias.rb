class CreateFamilias < ActiveRecord::Migration
  def change
    create_table :familias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
