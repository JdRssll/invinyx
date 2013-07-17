class CreateFacturaHasArticulos < ActiveRecord::Migration
  def change
    create_table :factura_has_articulos do |t|
      t.integer :factura_id
      t.string :articulo_id
      t.float :cantidad

    end
  end
end
