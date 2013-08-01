class FacturaHasArticulo < ActiveRecord::Base
  attr_accessible :cantidad, :articulo_id, :factura_id

  validates_presence_of :cantidad, :articulo_id

	belongs_to :factura
	belongs_to :articulo
end
