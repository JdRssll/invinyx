class ProveedorsController < ApplicationController

	before_filter :authenticate_user!


  def index
  	@proveedores = Proveedor.all
  end
end
