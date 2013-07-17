class Pedido < ActiveRecord::Base
  attr_accessible :empleado_id, :pedido_has_articulos_attributes
  has_many :pedido_has_articulos
  has_many :articulos, :through => :pedido_has_articulos
  belongs_to :empleado
  accepts_nested_attributes_for :pedido_has_articulos, :allow_destroy => true
  before_save :restar_cantidad_a_articulo
  validates_presence_of :empleado_id
  

	def cantidad_del_articulo_pedido(articulo)
		pedido = PedidoHasArticulo.where(pedido_id: self.id, articulo_id: articulo)
		pedido.first.cantidad
	end

  def restar_cantidad_a_articulo
    self.pedido_has_articulos.each do |registro|
      articulo = Articulo.find(registro.articulo_id)
      articulo.update_attribute(:cantidad, articulo.cantidad-registro.cantidad)
    end 
  end

  rails_admin do 
  	field :empleado
  end
end
