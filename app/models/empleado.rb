class Empleado < ActiveRecord::Base
  set_primary_key :cedula
  attr_accessible :apellido, :nombre, :direccion, :email, :telefono, :cargo, :cedula
end
