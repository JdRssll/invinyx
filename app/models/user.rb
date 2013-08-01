class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :email, :password, :password_confirmation, :remember_me, :nombre, :apellido, :telefono

  validates :apellido, :nombre, :length => { :maximum => 20 }
  validates_presence_of :apellido, :nombre, :telefono
  validates :apellido, :nombre, :format => { :with => /\A[a-zA-Z]+\z/, :message => I18n.t('errors.messages.only_letters') }
  validates :telefono, :length => { :minimum => 7, :maximum => 11 }
  validates_numericality_of :telefono, :only_integer => true

  def role?(role)
    a = false
    self.roles.each { |rol| a = true if rol.nombre == role.to_s.camelize }
    a
  end

  def admin?
    a = false
    self.roles.each { |rol| a = true if rol.nombre == "Administrador" }
    a
  end

  rails_admin do
  	label "Usuario"
  	label_plural "Usuarios"

    create do
      field :email
      field :nombre
      field :apellido
      field :telefono
      field :password
      field :password_confirmation
      field :roles
    end
  end
end
