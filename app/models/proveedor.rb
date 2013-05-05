class Proveedor < ActiveRecord::Base
	set_primary_key :rif
	has_many :facturas, :dependent => :destroy
  attr_accessible :nombre, :rif, :telefono, :direccion, :email

  #validaciones
  validates_presence_of :rif, :nombre, :direccion, :telefono, :email
  validates_uniqueness_of :rif, :email

  #validaciones para nombre
  validates :nombre, :length => { :minimum => 4, :maximum => 20 }

  #validaciones para email
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create } 
  
  #validaciones para telefono
  validates :telefono, :length => { :minimum => 7, :maximum => 11 }
  validates_numericality_of :telefono, :only_integer => true

  #validaciones para direccion
  validates :direccion, :length => { :minimum => 8, :maximum => 120 }

  rails_admin do
  	field :rif
  	field :nombre
  	field :direccion, :text
  	field :telefono
  	field :email
  end

end
