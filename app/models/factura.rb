class Factura < ActiveRecord::Base
	belongs_to :proveedor
  has_many :factura_has_articulos
  has_many :articulos, through: :factura_has_articulos

  attr_accessible :fecha, :proveedor_id, :factura_has_articulos_attributes
  #validaciones en general
  validates_presence_of :fecha, :proveedor_id, :factura_has_articulos

  #validaciones para asociaciones
  validates_associated :proveedor

  validate :permitir_factura_cantidad?

  before_save :asignar_cantidad_a_articulo

 
  accepts_nested_attributes_for :factura_has_articulos, :allow_destroy => true


  def permitir_factura_cantidad?
   errors.add(:factura_has_articulos, 'La cantidad ingresada no puede ser mayor o igual a 0') if self.factura_has_articulos.inject(true) { |validador, registro| registro.cantidad <= 0 }
  end

  def asignar_cantidad_a_articulo
    self.factura_has_articulos.each do |registro|
      articulo = Articulo.find(registro.articulo_id)
      articulo.update_attribute(:cantidad, articulo.cantidad+registro.cantidad)
    end 
  end
  

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :fecha do 
      strftime_format "%d-%m-%Y"
    end
  	field :proveedor
    field :factura_has_articulos do
      label "Ingresar artículos"
      partial "articulos_has_facturas/form_articulos_has_facturas"
    end
  end

end
