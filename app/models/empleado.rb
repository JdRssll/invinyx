class Empleado < ActiveRecord::Base
  set_primary_key :cedula
  has_many :pedidos
  belongs_to :obra
  attr_accessible :apellido, :nombre, :direccion, :email, :telefono, :cargo, :cedula, :obra_id
  
  #validaciones en general
  validates_presence_of :apellido, :nombre, :direccion, :telefono, :cargo, :cedula, :obra
  validates_uniqueness_of :cedula, :email

  #validaciones para email
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  #validaciones para asociaciones
  validates_associated :obra

  #vvalidaciones para nombre y apellido
  validates :apellido, :nombre, :length => { :maximum => 20 }
  validates :apellido, :nombre, :format => { :with => /\A[a-zA-Z]+\z/, :message => I18n.t('errors.messages.only_letters') }

  #validaciones para direccion
  validates :direccion, :length => { :maximum => 140 }

  #validaciones para cargo
  validates :cargo, :length => { :maximum => 80 }

  #validaciones para telefono
  validates :telefono, :length => { :minimum => 7, :maximum => 11 }
  validates_numericality_of :telefono, :only_integer => true
  
  #validaciones para cedula
  validates :cedula, :length => { :minimum => 6, :maximum => 8 }
  validates_numericality_of :cedula, :only_integer => true

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
    object_label_method :custom_label_method
  	field :cedula
    field :nombre
    field :apellido
    field :direccion, :text
    field :telefono
    field :obra
    field :email
    field :cargo
  end

  private

  #Metodo para etiqueta de instancia
  def custom_label_method
    "#{self.nombre} #{self.apellido}"
  end
end
