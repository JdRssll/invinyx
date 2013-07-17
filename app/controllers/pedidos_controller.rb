class PedidosController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@pedidos = Pedido.all
  end

  def show
  	@pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
  	@empleados = Empleado.all
  	@articulos = Articulo.all
  end

  def create
    @pedido = Pedido.new(params[:pedido])
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Producto was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def asignar_empleado_a_pedido  	
  	@empleado = Empleado.find(params[:id])
  end

  def asignar_articulo_a_pedido   
    @articulo = Articulo.find(params[:id])
  end

end
