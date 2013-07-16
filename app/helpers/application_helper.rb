module ApplicationHelper
	def asignar_articulo_a_pedido(articulo)
		content_tag(:tr) do
			render partial: "pedidos/agregar_articulo", locals: { articulo: @articulo }
		end
	end
end
