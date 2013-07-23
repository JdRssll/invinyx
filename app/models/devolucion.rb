class Devolucion < ActiveRecord::Base
  attr_accessible :descripcion, :lista_de_articulos_pedidos_attributes
  has_many :lista_de_articulos_pedidos, class_name: "DevolucionHasPedidoshasarticulo"
  has_many :pedido_has_articulos, :through => :lista_de_articulos_pedidos
  accepts_nested_attributes_for :lista_de_articulos_pedidos, :allow_destroy => true
  before_save

  def obtener_pedido
  	self.lista_de_articulos_pedidos.first.pedido_has_articulo_id
  end

  def obtener_lista_de_devoluciones
  	DevolucionHasPedidoshasarticulo.where(pedido_has_articulo_id: self.obtener_pedido)
  end
end
