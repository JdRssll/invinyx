class TipoTransaccion < ActiveRecord::Base	
	has_many :transaccions, :dependent => :destroy
  attr_accessible :tipo

  #validaciones en general
  validates_presence_of :tipo

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :tipo
  	 list do
        field :transaccions
     end
  end
end
