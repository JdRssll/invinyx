class PedidoHasArticulo < ActiveRecord::Base
  attr_accessible :articulo_id, :cantidad, :pedido_id, :cantidad_devuelta
  belongs_to :pedido
  belongs_to :articulo
  has_many :devoluciones, class_name: "DevolucionHasPedidoshasarticulo"
  has_many :devolucions, :through => :devoluciones
  validates_presence_of :cantidad
  validates_numericality_of :cantidad, { :greater_than_or_equal_to => 1 }


  def asignar_estado
  	articulo = Articulo.find(self.articulo_id)
  	if !articulo.consumible?
  		self.estado = 0
  	else
  		self.estado = 1	
  	end
  end

  #retorna la lista de articulos de un pedido, recive como parametro el pedido
  def self.articulos_del_pedido(pedido)
    @articulos = []
    PedidoHasArticulo.where(pedido_id: pedido.id).each do |pedido|
      @articulos << Articulo.find(pedido.articulo_id)
    end
    @articulos
  end

end
