class CreatePedidoHasArticulos < ActiveRecord::Migration
  def change
    create_table :pedido_has_articulos do |t|
      t.integer :pedido_id
      t.integer :articulo_id
      t.float :cantidad
      t.float :cantidad_devuelta, default: 0
      t.string :estado

      t.timestamps
    end
    add_foreign_key(:pedido_has_articulos, :pedidos)
    add_foreign_key(:pedido_has_articulos, :articulos)
  end
end
