class PedidoHasArticulo < ActiveRecord::Base
  attr_accessible :articulo_id, :cantidad, :pedido_id
  belongs_to :pedido
  belongs_to :articulo
  has_many :devolucion_has_pedidos
  has_many :devoluciones, :through => :devolucion_has_pedido
  validates_presence_of :cantidad
end
