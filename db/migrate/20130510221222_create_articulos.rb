class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :codigo, :primary_key, limit: 12
      t.string :nombre, limit: 60, null: false
      t.text :descripcion, limit: 140, null: false
      t.string :unidad_de_medida, limit: 15, null: false
      t.float :cantidad
      t.binary :foto, limit: 3.megabyte
      t.references :familia, null: false
      t.references :ubicacion, null: false
      t.float :stock_minimo
      t.float :stock_maximo
      t.boolean :consumible

      t.timestamp
    end
  end
end
