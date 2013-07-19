class FacturasController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@facturas = Factura.all
  end

  def show
  	@factura = Factura.find(params[:id])
  end
end
