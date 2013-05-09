class Transaccion < ActiveRecord::Base
	belongs_to :tipo_transaccion
  attr_accessible :cantidad, :descripcion, :tipo_transaccion_id
  validates_presence_of :cantidad, :tipo_transaccion_id
  validates_numericality_of :cantidad
  rails_admin do
  	field :cantidad
    field :tipo_transaccion do
      label "Tipo de transacción"
    end
  	field :descripcion, :text do
      label "Descripción"
    end
  	show do
  		field :updated_at
  		field :created_at
  	end

  	list do
  		field :created_at
  	end
  end
end
