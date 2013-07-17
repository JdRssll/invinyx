class Transaccion < ActiveRecord::Base
	belongs_to :tipo_transaccion
  belongs_to :articulo
  attr_accessible :cantidad, :descripcion, :tipo_transaccion_id, :articulo_id

  before_save :transacciones

  #validaciones en general
  validates_presence_of :cantidad, :tipo_transaccion_id, :articulo_id
  validates :cantidad, :numericality => { :greater_than_or_equal_to => 1 }
  validate :permite_salida?


  def transacciones
    articulo = Articulo.find(self.articulo_id)
    if self.tipo_transaccion_id == 1
      articulo.update_attribute(:cantidad, articulo.cantidad+self.cantidad)
    else
      articulo.update_attribute(:cantidad, articulo.cantidad-self.cantidad)
    end    
  end

  def permite_salida?
    articulo = Articulo.find(self.articulo_id)
    if self.tipo_transaccion_id == 2 and articulo.cantidad == 0
      errors.add(:tipo_transaccion, I18n.t('errors.messages.tipo_transaccion'))
    end
  end

  #Configuracion de Rails_admin CREATE,SHOW,LIST,UPDATE
  rails_admin do
  	field :articulo
    field :cantidad

    field :tipo_transaccion do
      inline_add false
      inline_edit false
    end
    
  	field :descripcion, :text do
    end

    show do
      field :created_at do
        strftime_format "%d-%m-%Y"
      end  
    end

    list do
      field :created_at do
        strftime_format "%d-%m-%Y"
      end  
    end
  end
end
