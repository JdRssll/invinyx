class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :articulos

  def articulos
  	@articulos = Articulo.all
  end

  def articulos_facturas
  	@articulo = Articulo.find(params[:id])
  end

end
