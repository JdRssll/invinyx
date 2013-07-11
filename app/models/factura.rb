class Factura < ActiveRecord::Base
	belongs_to :proveedor
  has_many :factura_has_articulos
  has_many :articulos, through: :factura_has_articulos

  before_save :insertar_datos_factura_has_articulos


  attr_accessible :fecha, :proveedor_id, :articulo_ids, :articulos_has_facturas_ids
  attr_accessor :cantidad
  #validaciones en general
  validates_presence_of :fecha, :proveedor_id

  #validaciones para asociaciones
  validates_associated :proveedor

  
  accepts_nested_attributes_for :articulos, :allow_destroy => true


  def insertar_datos_factura_has_articulos
    puts "HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA #{self.proveedor_id} asd"
    puts self.proveedor_id
    puts self.articulo_ids
    puts self.cantidad 
    puts self.fecha
    puts "HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  end

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :fecha do 
      strftime_format "%d-%m-%Y"
    end
  	field :proveedor
    field :articulo_ids do
      partial "articulos_has_facturas/form_articulos_has_facturas"
    end
  end

end
