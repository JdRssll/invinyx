class Obra < ActiveRecord::Base
  has_many :empleados, :dependent => :destroy
  attr_accessible :nombre

  rails_admin do
  	create do
  		field :nombre
  	end
  end

end
