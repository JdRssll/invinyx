class Empleado < ActiveRecord::Base
  set_primary_key :cedula
  belongs_to :obra
  attr_accessible :apellido, :nombre, :direccion, :email, :telefono, :cargo, :cedula, :obra_id
  
end
