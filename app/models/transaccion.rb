class Transaccion < ActiveRecord::Base
	belongs_to :tipo_transaccion
  attr_accessible :cantidad, :descripcion, :tipo_transaccion_id

  #validaciones en general
  validates_presence_of :cantidad, :tipo_transaccion_id
  validates_numericality_of :cantidad

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :cantidad

    field :tipo_transaccion do
      inline_add false
      inline_edit false
    end
    
  	field :descripcion, :text do
    end

    show do
      field :created_at do
        strftime_format "%d-%m-%Y"
      end  
    end

    list do
      field :created_at do
        strftime_format "%d-%m-%Y"
      end  
    end
  end
end
