class Pedido < ActiveRecord::Base
  attr_accessible :empleado_id
  belongs_to :empleado
  rails_admin do 
  	field :empleado
  end
end
