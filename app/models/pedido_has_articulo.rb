class PedidoHasArticulo < ActiveRecord::Base
  attr_accessible :articulo_id, :cantidad, :pedido_id
  belongs_to :pedido
  belongs_to :articulo
end
