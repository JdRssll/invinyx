class Factura < ActiveRecord::Base
	belongs_to :proveedor
  attr_accessible :fecha, :proveedor_id

  #validaciones en general
  validates_presence_of :fecha, :proveedor_id

  #validaciones para asociaciones
  validates_associated :proveedor

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :fecha do 
      label "Fecha de emisión"
      strftime_format "%d-%m-%Y"
    end
  	field :proveedor
  end

end