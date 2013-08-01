class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :articulos

  def articulos
  	@articulos = Articulo.all
  end

  def articulos_facturas
  	@articulo = Articulo.find(params[:id])
  end

  def get_model
    @model_name = to_model_name(params[:model_name])
    raise RailsAdmin::ModelNotFound unless (@abstract_model = RailsAdmin::AbstractModel.new(@model_name))
    raise RailsAdmin::ModelNotFound if (@model_config = @abstract_model.config).excluded?
    @properties = @abstract_model.properties
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    redirect_to index_path, :alert => t("errors.messages.exception.restrict")
  end

end
