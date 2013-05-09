class Factura < ActiveRecord::Base
	belongs_to :proveedor
  attr_accessible :fecha, :proveedor_id

  #validaciones en general
  validates_presence_of :fecha, :proveedor_id
  #validaciones para asociaciones
  validates_associated :proveedor

  rails_admin do
  	field :fecha
  	field :proveedor_id
  end

end
