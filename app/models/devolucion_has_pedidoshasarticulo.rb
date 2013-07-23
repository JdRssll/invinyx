class DevolucionHasPedidoshasarticulo < ActiveRecord::Base
  attr_accessible :cantidad, :pedido_has_articulo_id, :devolucion_id
  belongs_to :devolucion
  belongs_to :pedido_has_articulo
end
