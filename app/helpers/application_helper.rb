module ApplicationHelper

	def formulario_articulo(articulo)
		content_tag(:tr, id: "#{@articulo.codigo}") do
			render :partial => "application/form_tabla_factura", locals: { articulo: @articulo }
		end
	end

end
