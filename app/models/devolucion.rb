class Devolucion < ActiveRecord::Base
  attr_accessible :descripcion, :lista_de_articulos_pedidos_attributes
  has_many :lista_de_articulos_pedidos, class_name: "DevolucionHasPedidoshasarticulo"
  has_many :pedido_has_articulos, :through => :lista_de_articulos_pedidos
  accepts_nested_attributes_for :lista_de_articulos_pedidos, :reject_if => lambda { |a| a[:cantidad].to_f.zero? }, :allow_destroy => true
  before_save :sumar_cantidad_devuelta_al_articulo
  after_save :actualizar_cantidad_devuelta_de_pedido, :cambiar_estado_individual_del_pedido, :cambiar_estado_general_del_pedido 
  validates_presence_of :descripcion, message: I18n.t('errors_invinyx.devolucion.descripcion')
  validates_presence_of :lista_de_articulos_pedidos, message: I18n.t('errors_invinyx.devolucion.lista_vacia')

  def obtener_id_del_pedido
  	self.lista_de_articulos_pedidos.first.pedido_has_articulo_id
  end

  def actualizar_cantidad_devuelta_de_pedido
  	self.obtener_registros_del_pedido.each	do |pedido|
  		pedido.update_attribute(:cantidad_devuelta, self.sumar_cantidades(pedido.articulo_id))	
  	end  		
  end

  def obtener_registros_del_pedido
  	Pedido.find(self.obtener_id_del_pedido).lista_de_articulos
  end

  def sumar_cantidades(articulo)
  	devoluciones = DevolucionHasPedidoshasarticulo.where(pedido_has_articulo_id: self.obtener_id_del_pedido, articulo_id: articulo)
  	devoluciones.inject(0) { |total, articulo| total+=articulo.cantidad }
  end

  def cambiar_estado_individual_del_pedido
    self.obtener_registros_del_pedido.each do |pedido|
      if pedido.cantidad == pedido.cantidad_devuelta
        pedido.update_attribute(:estado, "Retribuido")
      end
    end
  end

  def cambiar_estado_general_del_pedido
    unless self.obtener_registros_del_pedido.drop_while {|i| i.estado == "Activo" }.size.zero?
      Pedido.find(self.obtener_id_del_pedido).update_attribute(:estado, "Retribuido")
    end
  end

  def sumar_cantidad_devuelta_al_articulo
    self.lista_de_articulos_pedidos.each  do |registro|
      articulo = registro.obtener_articulo
      articulo.update_attribute(:cantidad, articulo.cantidad+registro.cantidad)
    end
  end


end
