class Articulo < ActiveRecord::Base
  attr_accessible :codigo, :nombre, :descripcion, :unidad_de_medida, :foto, :foto_cache, :remove_foto, :familia_id, :ubicacion_id, :stock_minimo, :stock_maximo, :consumible

  mount_uploader :foto, FotoUploader
  belongs_to :familia
  belongs_to :ubicacion

  rails_admin do
  	field :codigo
  	field :nombre
  	field :descripcion
  	field :unidad_de_medida, :enum do 
  		enum do
    		['Unid.', 'Mts.', 'Mts2.', 'Kgs.', 'Lts.']
  		end
		end
  	field :foto, :carrierwave
  	field :familia
  	field :ubicacion
  	field :stock_maximo, :integer
  	field :stock_minimo, :integer
  	field :consumible
  end
end
