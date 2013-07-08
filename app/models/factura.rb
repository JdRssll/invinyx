class Factura < ActiveRecord::Base
	belongs_to :proveedor
  has_and_belongs_to_many :articulos
  attr_accessible :fecha, :proveedor_id, :articulo_ids
  #validaciones en general
  validates_presence_of :fecha, :proveedor_id

  #validaciones para asociaciones
  validates_associated :proveedor

  
  accepts_nested_attributes_for :articulos

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
