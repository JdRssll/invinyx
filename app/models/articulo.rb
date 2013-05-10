class Articulo < ActiveRecord::Base
  attr_accessible :codigo, :nombre, :descripcion, :unidad_de_medida, :foto, :familia_id, :ubicacion_id, :stock_minimo, :stock_maximo, :consumible
end
