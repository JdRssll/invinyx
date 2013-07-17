class Articulo < ActiveRecord::Base
  attr_accessible :codigo, :nombre, :descripcion, :unidad_de_medida, :foto, :foto_cache, :remove_foto, :familia_id, :ubicacion_id, :stock_minimo, :stock_maximo, :consumible, :cantidad

  #validaciones en general
  validates_presence_of :codigo, :nombre, :unidad_de_medida, :familia, :ubicacion
  validates_uniqueness_of :codigo, :nombre

  #validacion para descripcion
  validates :descripcion, :length => { :maximum => 140}

  #valdiaciones personalizadas
  validate :stock_maximo_mayor?

  has_many :factura_has_articulos
  has_many :facturas, through: :factura_has_articulos

  has_many :articulos_proveedors
  has_many :proveedors, through: :articulos_proveedors

  has_many :transaccions

  mount_uploader :foto, FotoUploader
  belongs_to :familia
  belongs_to :ubicacion

  rails_admin do
  	create do
      field :codigo, :string
    	field :nombre
    	field :descripcion
    	field :unidad_de_medida, :enum do 
    		enum do
      		['Unid.', 'Mts.', 'Mts2.', 'Kgs.', 'Lts.']
    		end
  		end
    	field :foto, :carrierwave
    	field :familia
    	field :ubicacion
    	field :stock_maximo, :integer
    	field :stock_minimo, :integer
    	field :consumible
      exclude_fields :articulos_proveedors, :proveedors
    end

    list do
      field :codigo   
      field :nombre
      field :cantidad
      field :descripcion
      field :unidad_de_medida 
      exclude_fields :articulos_proveedors
    end

    edit do
      exclude_fields :cantidad, :facturas, :transaccions, :articulos_proveedors, :proveedors
    end

    show do
      exclude_fields :facturas, :transaccions, :articulos_proveedors
    end
  end

  private

  #validacion, stock maximo no puede ser menor a stock minimo
  def stock_maximo_mayor?
    if self.stock_maximo < self.stock_minimo
      errors.add(:stock_maximo, I18n.t('errors.messages.stock_maximo')) 
      errors.add(:stock_minimo, I18n.t('errors.messages.stock_minimo'))
    end
  end



end

