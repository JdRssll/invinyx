class Pedido < ActiveRecord::Base
  attr_accessible :empleado_id, :pedido_has_articulos_attributes
  has_many :pedido_has_articulos
  has_many :articulos, :through => :pedido_has_articulos
  belongs_to :obra
  belongs_to :empleado
  accepts_nested_attributes_for :pedido_has_articulos, :allow_destroy => true
  before_save :restar_cantidad_a_articulo, :asignar_estado_individual, :asignar_estado_general
  validates_presence_of :empleado_id
  validates_presence_of :pedido_has_articulos, message: I18n.t('errors.messages.pedido_has_articulos')
  validate :permitir_cantidad?, :cantidad_de_pedido_mayor?
  
  #valida que la cantidad no pueda ser menor o igual a 0
  def permitir_cantidad?
    errors.add(:pedido_has_articulos, 'la cantidad ingresada no puede ser menor o igual a 0') if self.pedido_has_articulos.inject(true) { |validador, registro| registro.cantidad <= 0 }
  end

  #valida cuando la cantidad del articulo pedido es mayor a la cantidad del articulo
  def cantidad_de_pedido_mayor?
    self.pedido_has_articulos.each  do |registro|
      articulo = Articulo.find(registro.articulo_id)
      if registro.cantidad > articulo.cantidad
        return errors.add(:pedido_has_articulos, "#{articulo.codigo} la cantidad pedida excede a la del inventario")
      end
    end
    false
  end

  def asignar_estado_general
    self.pedido_has_articulos.each do |registro|
      if registro.estado == "Activo"
        self.estado = "Activo"
        break
      elsif 
        self.estado = "Retribuido"
      end
    end
  end

  def asignar_estado_individual
    self.pedido_has_articulos.each do |registro|
      articulo = Articulo.find(registro.articulo_id)
      if articulo.consumible
        registro.estado = "Consumible"
      elsif !articulo.consumible && registro.cantidad_devuelta == registro.cantidad
        registro.estado = "Retribuido"
      else
        registro.estado = "Activo" 
      end
    end
  end

  #retorna la cantidad devuelta de cada articulo pedido
  def cantidad_devuelta_del_articulo_pedido(articulo)
    pedido = PedidoHasArticulo.where(pedido_id: self.id, articulo_id: articulo)
    pedido.first.cantidad_devuelta
  end

  #retorna el estado de cada articulo pedido
  def estado_del_articulo_pedido(articulo)
    pedido = PedidoHasArticulo.where(pedido_id: self.id, articulo_id: articulo)
    pedido.first.estado
  end

	#retorna la cantidad que se pidio por cada articulo
  def cantidad_del_articulo_pedido(articulo)
		pedido = PedidoHasArticulo.where(pedido_id: self.id, articulo_id: articulo)
		pedido.first.cantidad
	end

  #resta la cantidad pedida al articulo
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
