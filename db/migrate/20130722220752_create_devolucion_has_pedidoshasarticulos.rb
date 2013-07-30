class CreateDevolucionHasPedidoshasarticulos < ActiveRecord::Migration
  def change
    create_table :devolucion_has_pedidoshasarticulos do |t|
    	t.integer :devolucion_id
    	t.integer :pedido_has_articulo_id
    	t.integer :articulo_id
    	t.float :cantidad

      t.timestamps
    end
    add_foreign_key(:devolucion_has_pedidoshasarticulos, :devolucions)
    add_foreign_key(:devolucion_has_pedidoshasarticulos, :pedido_has_articulos)
  end
end
