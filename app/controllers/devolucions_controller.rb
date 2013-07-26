class DevolucionsController < ApplicationController 
	before_filter :authenticate_user!	
  def index
  end

  def new
  	@devolucion = Devolucion.new
  	@pedido = Pedido.find(params[:pedido_id])
  end

  def create
    params[:devolucion][:lista_de_articulos_pedidos_attributes].values.each do |item|
      @id = item[:pedido_has_articulo_id]
      break
    end
    @errores = []
  	@devolucion = Devolucion.new(params[:devolucion])
    
    @pedido = Pedido.find(@id)
    respond_to do |format|
      if @devolucion.save
        format.html { redirect_to pedido_path(@id), notice: 'Producto was successfully created.' }
      else
        format.html { redirect_to new_pedido_devolucion_path(@id), :flash => { :alert => @devolucion.errors.messages } }
        format.json { render json: @devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @devolucion = Devolucion.find(params[:id])
  end

  
  
end
