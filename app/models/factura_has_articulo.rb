class FacturaHasArticulo < ActiveRecord::Base
  attr_accessible :cantidad, :articulo_id, :factura_id
	belongs_to :factura
	belongs_to :articulo
end
