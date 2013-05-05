class Proveedor < ActiveRecord::Base
	set_primary_key :rif
  attr_accessible :nombre, :rif, :telefono, :direccion, :email
  #validaciones
  

end
