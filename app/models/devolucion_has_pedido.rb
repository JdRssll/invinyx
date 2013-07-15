class DevolucionHasPedido < ActiveRecord::Base
  attr_accessible :cantidad, :devolucion_id, :pedido_has_articulo_id
  belongs_to :devolucion
  belongs_to :pedido_has_articulo
end
