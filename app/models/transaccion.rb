class Transaccion < ActiveRecord::Base
	belongs_to :tipo_transaccion
  attr_accessible :cantidad, :descripcion

  rails_admin do
  	field :cantidad
  	field :tipo_transaccion
  	field :descripcion, :text
  end
end
