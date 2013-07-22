class Devolucion < ActiveRecord::Base
  attr_accessible :descripcion, :devolucion_has_pedidos_attributes
  has_many :devolucion_has_pedidos
  has_many :pedido_has_articulos, :through => :devolucion_has_pedido
  accepts_nested_attributes_for :devolucion_has_pedidos, :allow_destroy => true
  validates_presence_of :devolucion_has_pedidos
end
