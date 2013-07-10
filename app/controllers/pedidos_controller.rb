class PedidosController < ApplicationController
  def index
  	@pedidos = Pedido.all
  end

  def show
  	@pedido = Pedido.find(params[:id])
  end
end
