class CreatePedidoHasArticulos < ActiveRecord::Migration
  def change
    create_table :pedido_has_articulos do |t|
      t.integer :pedido_id
      t.integer :articulo_id
      t.float :cantidad

      t.timestamps
    end
  end
end
