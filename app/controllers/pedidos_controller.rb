class PedidosController < ApplicationController
  def index
  	@pedidos = Pedido.all
  end

  def show
  	@pedido = Pedido.find(params[:id])
  end

  def new
  	@empleados = Empleado.all
  	@articulos = Articulo.all
  end

  def asignar_empleado_a_pedido  	
  	@empleado = Empleado.find(params[:id])
  end

  def asignar_articulo_a_pedido   
    @articulo = Articulo.find(params[:id])
  end

end
