class Proveedor < ActiveRecord::Base
	has_many :facturas, :dependent => :destroy
  attr_accessible :nombre, :rif, :telefono, :direccion, :email, :contacto

  #validaciones en general
  validates_presence_of :nombre, :telefono

  #validaciones para rif
  #validates :rif, :format => { :with => /\A(?=.*[a-z])[a-z\d]+\Z/i, :on => :create }
  validates :rif, :length => { :maximum => 11, :on => :create } 

  #validaciones para nombre
  validates :nombre, :contacto, :length => { :maximum => 40 }
 
  #validaciones para email
  #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create } 
  
  #validaciones para telefono
  validates :telefono, :length => { :minimum => 7, :maximum => 11 }
  validates_numericality_of :telefono, :only_integer => true

  #validaciones para direccion
  validates :direccion, :length => { :maximum => 120 }

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :rif
  	field :nombre
  	field :direccion, :text
  	field :telefono
    field :contacto
  	field :email
  end

end
