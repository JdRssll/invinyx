class Obra < ActiveRecord::Base
  attr_accessible :nombre

  rails_admin do
  	list do
  		field :id
  		field :nombre
  	end
  end

end
