class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :codigo, limit: 12
      t.string :nombre, limit: 60, null: false
      t.text :descripcion, limit: 140, null: false
      t.string :unidad_de_medida, limit: 15, null: false
      t.float :cantidad, default: 0
      t.string :foto, limit: 3.megabyte
      t.integer :familia_id, null: false
      t.integer :ubicacion_id, null: false
      t.float :stock_minimo
      t.float :stock_maximo
      t.boolean :consumible, default: false

      t.timestamp
    end
    #add_foreign_key(:articulos, :familias)
    add_foreign_key(:articulos, :ubicacions)
  end
end
