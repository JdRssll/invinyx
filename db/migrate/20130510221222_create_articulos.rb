class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos, {:id => false} do |t|
      t.string :codigo, limit: 12
      t.string :nombre, limit: 60, null: false
      t.text :descripcion, limit: 140, null: false
      t.string :unidad_de_medida, limit: 15, null: false
      t.float :cantidad, default: 0
      t.string :foto, limit: 3.megabyte
      t.string :familia_id, null: false
      t.string :ubicacion_id, null: false
      t.float :stock_minimo
      t.float :stock_maximo
      t.boolean :consumible

      t.timestamp
    end
    execute "ALTER TABLE articulos ADD PRIMARY KEY (codigo)"
  end
end
