class Persona < ActiveRecord::Base
  attr_accessible :nombre, :apellido, :direccion, :telefono, :email, :cargo
  validates_presence_of :nombre, :apellido, :direccion, :telefono, :email, :cargo



end
