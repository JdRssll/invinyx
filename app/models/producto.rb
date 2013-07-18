class Producto < ActiveRecord::Base
  attr_accessible :cantidad, :descriptcion, :nombre
  validates_presence_of :cantidad, :nombre
end
