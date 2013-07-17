class CreateArticulosProveedors < ActiveRecord::Migration
  def change
    create_table :articulos_proveedors do |t|
      t.string :articulo_id
      t.integer :proveedor_id

      t.timestamps
    end
  end
end
