class Transaccion < ActiveRecord::Base
	belongs_to :tipo_transaccion
  attr_accessible :cantidad, :descripcion, :tipo_transaccion_id
  validates_presence_of :cantidad, :tipo_transaccion_id
  validates_numericality_of :cantidad
  rails_admin do
  	field :cantidad
  	field :tipo_transaccion
  	field :descripcion, :text
  end
end
