class Empleado < ActiveRecord::Base
  set_primary_key :cedula
  belongs_to :obra
  attr_accessible :apellido, :nombre, :direccion, :email, :telefono, :cargo, :cedula, :obra_id
  
  #validaciones en general
  validates_presence_of :apellido, :nombre, :direccion, :telefono, :cargo, :cedula
  validates_uniqueness_of :cedula, :email  
  #validaciones para email
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  #validaciones para asociaciones
  validates_associated :obra
  #vvalidaciones para nombre y apellido
  validates :apellido, :nombre, :length => { :minimum => 3, :maximum => 20 }
  validates :apellido, :nombre, :format => { :with => /\A[a-zA-Z]+\z/, :message => "sólo permite letras" }
  #validaciones para direccion
  validates :direccion, :length => { :minimum => 8, :maximum => 120 }
  #validaciones para cargo
  validates :cargo, :length => { :minimum => 4, :maximum => 80 }
  #validaciones para telefono
  validates :telefono, :length => { :minimum => 7, :maximum => 11 }
  validates_numericality_of :telefono, :only_integer => true
  #validaciones para cedula
  validates :cedula, :length => { :minimum => 7, :maximum => 8 }
  validates_numericality_of :cedula, :only_integer => true

  rails_admin do
  	field :cedula
  	field :nombre
  	field :apellido
  	field :direccion, :text
  	field :telefono
  	field :obra
  	field :email
  	field :cargo
  end
end
