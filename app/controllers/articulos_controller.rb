class ArticulosController < ApplicationController

	before_filter :authenticate_user!

  
  def index
  	@articulos = Articulo.all
  end

  def show
  	@articulo = Articulo.find(params[:id])
  end

end
