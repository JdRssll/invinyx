class DevolucionHasPedidoshasarticulo < ActiveRecord::Base
  attr_accessible :cantidad, :pedido_has_articulo_id, :devolucion_id, :articulo_id
  belongs_to :devolucion
  belongs_to :pedido_has_articulo

  validate :permitir_cantidad?
  validates_numericality_of :cantidad, { :greater_than_or_equal_to => 0 }

  def obtener_articulo
  	Articulo.find(self.articulo_id)	
  end

  def registro
  	PedidoHasArticulo.where(pedido_id: self.pedido_has_articulo_id, articulo_id: self.articulo_id)
  end

  def pedido
  	Pedido.find(self.pedido_has_articulo_id)
  end

  def permitir_cantidad?
  	self.pedido.lista_de_articulos.each do |registro|
  		if self.cantidad > self.pedido.cantidad_por_remunerar(registro.articulo_id) && self.articulo_id == registro.articulo_id
  			return errors.add(:cantidad, I18n.t('errors_invinyx.devolucion.cantidad'))
  		end
  	end
  	false
  end

end
