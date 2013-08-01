class CreateArticulosProveedors < ActiveRecord::Migration
  def change
    create_table :articulos_proveedors do |t|
      t.integer :articulo_id
      t.integer :proveedor_id

      t.timestamps
    end
    add_foreign_key(:articulos_proveedors, :proveedors)
    add_foreign_key(:articulos_proveedors, :articulos)
  end
end
