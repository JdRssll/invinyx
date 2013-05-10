class Ubicacion < ActiveRecord::Base
  attr_accessible :nombre

  #validaciones en general
  validates_presence_of :nombre
  validates_length_of :nombre, :maximum => 80, :minimum => 5
  validates_uniqueness_of :nombre

end
