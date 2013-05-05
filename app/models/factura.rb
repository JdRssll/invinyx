class Factura < ActiveRecord::Base
	belongs_to :proveedor
  attr_accessible :fecha, :proveedor_rif

  #validaciones en general
  validates_presence_of :fecha, :proveedor_rif

  #validaciones para asociaciones
  validates_associated :proveedor

end
