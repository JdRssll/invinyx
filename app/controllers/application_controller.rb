class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :articulos


  def articulos
  	@articulos = Articulo.all.map
  end

end
