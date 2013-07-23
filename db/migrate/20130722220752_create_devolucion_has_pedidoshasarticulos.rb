class CreateDevolucionHasPedidoshasarticulos < ActiveRecord::Migration
  def change
    create_table :devolucion_has_pedidoshasarticulos do |t|
    	t.integer :devolucion_id
    	t.integer :pedido_has_articulo_id
    	t.float :cantidad

      t.timestamps
    end
  end
end
