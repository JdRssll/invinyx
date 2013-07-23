class DevolucionsController < ApplicationController 
	before_filter :authenticate_user!	
  def index
  end

  def new
  	@devolucion = Devolucion.new
  	@pedido = Pedido.find(params[:pedido_id])
  end

  def create
  	@devolucion = Devolucion.new(params[:devolucion])
    respond_to do |format|
      if @devolucion.save
        format.html { redirect_to @devolucion, notice: 'Producto was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @devolucion.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
