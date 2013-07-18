class DevolucionsController < ApplicationController
  

	before_filter :authenticate_user!
	layout "layouts/frontend"

	
  def index
  end
end
