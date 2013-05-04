class Obra < ActiveRecord::Base
  has_many :empleados, :dependent => :destroy
  attr_accessible :nombre

  validates_presence_of :nombre
  validates_length_of :nombre, :maximum => 45

  rails_admin do
  	create do
  		field :nombre
  	end
  end

end
