class ProveedorsController < ApplicationController

	before_filter :authenticate_user!
  	layout "layouts/frontend"
  def index
  	@proveedores = Proveedor.all
  end
end
