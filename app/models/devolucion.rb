class Devolucion < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :devolucion_has_pedidos
  has_many :pedido_has_articulos, :through => :devolucion_has_pedido
end
