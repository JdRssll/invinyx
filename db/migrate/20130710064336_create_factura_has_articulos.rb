class CreateFacturaHasArticulos < ActiveRecord::Migration
  def change
    create_table :factura_has_articulos do |t|
      t.integer :factura_id
      t.integer :articulo_id
      t.float :cantidad

    end
    add_foreign_key(:factura_has_articulos, :articulos)
    add_foreign_key(:factura_has_articulos, :facturas)
  end
end
