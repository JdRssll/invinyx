class Ubicacion < ActiveRecord::Base
  attr_accessible :nombre
  has_many :articulos

  #validaciones para nombre
  validates_presence_of :nombre
  validates_length_of :nombre, :maximum => 80, :minimum => 5
  validates_uniqueness_of :nombre

  rails_admin do
  	field :nombre
  	list do
  		field :nombre
  		field :articulos
  	end
    show do
      field :nombre
      field :articulos
    end
  end
end
