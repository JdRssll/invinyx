class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre, limit: 20, null: false
      t.string :apellido, limit: 20, null: false	
      t.string :direccion, limit: 20, null: false
      t.string :telefono, limit: 20, null: false
      t.string :email, limit: 20, null: false
      t.string :cargo, limit: 20, null: false

      t.timestamps
    end
  end
end
