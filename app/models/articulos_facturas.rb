class ArticulosFacturas < ActiveRecord::Base
	attr_accessible :cantidad, :articulo_id, :factura_id
end