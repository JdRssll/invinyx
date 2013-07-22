class DevolucionsController < ApplicationController 
	before_filter :authenticate_user!	
  def index
  end
  def new
  	@pedidos = Pedido.find(params[:id])
  end
  def create
  end
end
