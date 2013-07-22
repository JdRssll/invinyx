class ObrasController < ApplicationController
  def index
  	@obras = Obra.all()
  end

  def show
  	@obra = Obra.find(params[:id])
 	@listado = Pedido.listado_de_articulos_por_obra(Obra.find(params[:id]))	
  end

end
