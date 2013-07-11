module ApplicationHelper

	def formulario_articulo(articulo)
		content_tag(:tr) do
			render :partial => "application/form_tabla_factura", locals: { articulo: @articulo }
		end
	end

end
