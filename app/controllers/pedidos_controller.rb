class PedidosController < ApplicationController
  def index
  	@articulos = Articulo.all
  end
end
