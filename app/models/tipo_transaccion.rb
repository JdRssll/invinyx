class TipoTransaccion < ActiveRecord::Base
	has_many :transaccions, :dependent => :destroy
  attr_accessible :tipo
  validates_presence_of :tipo
end
