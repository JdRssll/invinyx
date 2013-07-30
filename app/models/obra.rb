class Obra < ActiveRecord::Base
  has_many :empleados, :dependent => :restrict
  has_many :pedidos, :dependent => :restrict
  attr_accessible :nombre

  #validaciones en general
  validates_presence_of :nombre
  validates_length_of :nombre, :maximum => 45, :minimum => 5

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :nombre
  	list do
  		field :nombre
  		field :empleados
  	end
    show do
      field :nombre
      field :empleados
    end
  end

end
