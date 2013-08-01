class ArticulosProveedor < ActiveRecord::Base
  attr_accessible :articulo_id, :proveedor_id

  belongs_to :articulo
  belongs_to :proveedor
end
