class Pedido < ActiveRecord::Base
  attr_accessible :empleado_id, :pedido_has_articulos_attributes
  has_many :pedido_has_articulos
  has_many :articulos, :through => :pedido_has_articulos
  belongs_to :empleado
  accepts_nested_attributes_for :pedido_has_articulos, :allow_destroy => true

	def cantidad_del_articulo_pedido(articulo)
		pedido = PedidoHasArticulo.where(pedido_id: self.id, articulo_id: articulo)
		pedido.first.cantidad
	end

  rails_admin do 
  	field :empleado
  end
end
