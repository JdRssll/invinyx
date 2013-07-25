class Pedido < ActiveRecord::Base
  attr_accessible :empleado_id, :obra_id, :lista_de_articulos_attributes
  has_many :lista_de_articulos, :class_name => "PedidoHasArticulo"
  has_many :articulos, :through => :lista_de_articulos
  belongs_to :obra
  belongs_to :empleado
  accepts_nested_attributes_for :lista_de_articulos, :allow_destroy => true
  before_save :asignar_estado_individual, :asignar_estado_general
  before_create :restar_cantidad_a_articulo
  validates_presence_of :empleado_id, :obra_id
  validates_presence_of :lista_de_articulos, message: I18n.t('errors.messages.lista_de_articulos')
  validate :cantidad_de_pedido_mayor?


  #valida cuando la cantidad del articulo pedido es mayor a la cantidad del articulo
  def cantidad_de_pedido_mayor?
    self.lista_de_articulos.each  do |registro|
      articulo = Articulo.find(registro.articulo_id)
      if registro.cantidad && registro.cantidad > articulo.cantidad
        return errors.add(:lista_de_articulos, "EL articulo #{articulo.codigo} la cantidad pedida excede a la del inventario")
      end
    end
    false
  end

  def asignar_estado_general
    self.lista_de_articulos.each do |registro|
      if registro.estado == "Activo"
        self.estado = "Activo"
        break
      elsif 
        self.estado = "Retribuido"
      end
    end
  end

  def asignar_estado_individual
    self.lista_de_articulos.each do |registro|
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

  #retorna la cantidad que falta por devolver del pedido
  def cantidad_por_remunerar(articulo)
    self.cantidad_del_articulo_pedido(articulo)-self.cantidad_devuelta_del_articulo_pedido(articulo)
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
    self.lista_de_articulos.each do |registro|
      articulo = Articulo.find(registro.articulo_id)
      articulo.update_attribute(:cantidad, articulo.cantidad-registro.cantidad)
    end 
  end

  #retorna un array con todas las devoluciones de un pedido
  def obtener_devoluciones
    DevolucionHasPedidoshasarticulo.where(pedido_has_articulo_id: self.id)
  end

  
  rails_admin do 
  	field :empleado
  end

  def self.listado_de_articulos_por_obra(obra)
    @listado = []
    Pedido.cantidad_de_articulos_por_obra(obra.id).each_pair do |k,v| 
      @listado << [Articulo.find(k), v]
    end
    @listado
  end

  private

  def self.cantidad_de_articulos_por_obra(id)
    @articulos = {}
    Pedido.where(obra_id: id).each do |pedido|
      pedido.lista_de_articulos.each do |articulos|
        if @articulos.include?(articulos.articulo_id) 
          @articulos[articulos.articulo_id]+=articulos.cantidad
        else
          @articulos.merge!(articulos.articulo_id => articulos.cantidad)
        end
      end 
    end
    @articulos      
  end

end
