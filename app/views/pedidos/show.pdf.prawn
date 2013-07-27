pdf.text_box "Pedido ##{@pedido.id}", size: 30, :align => :center, :style=>:bold
pdf.move_down(50)
pdf.text "-"*135
pdf.text 'Datos Personales', :align => :center, :style=>:bold
pdf.text "-"*135

pdf.text_box 'Cedula:', :at => [10, 620], :style=>:bold
pdf.text_box "#{@pedido.empleado.cedula}", :at => [57, 620]

pdf.text_box 'Cargo:', :at => [210, 620], :style=>:bold
pdf.text_box "#{@pedido.empleado.cargo}", :at => [250, 620]

pdf.text_box 'Estado:', :at => [410, 620], :style=>:bold
pdf.text_box "#{@pedido.estado}", :at => [455, 620]

pdf.text_box 'Empleado:', :at => [10, 595], :style=>:bold
pdf.text_box "#{@pedido.empleado.nombre} #{@pedido.empleado.apellido}", :at => [75, 595]

pdf.text_box 'Obra:', :at => [210, 595], :style=>:bold
pdf.text_box "#{@pedido.empleado.obra.nombre}", :at => [245, 595]

pdf.text_box 'Fecha:', :at => [410, 595], :style=>:bold
pdf.text_box "#{@pedido.created_at.strftime("%d %b. %Y")}", :at => [455, 595]

pdf.move_down(60)
pdf.text "-"*135
pdf.text 'Listado de Articulos', :align => :center, :style=>:bold
pdf.text "-"*135
pdf.move_down(10)
items = [['<b>Codigo</b>', '<b>Nombre</b>', '<b>Cantidad</b>', '<b>Estado</b>']]
items += @pedido.articulos.map do |item|
	[
		item.codigo,
		item.nombre,
		"#{@pedido.cantidad_del_articulo_pedido(item.id)} #{item.unidad_de_medida}",
		@pedido.estado_del_articulo_pedido(item.id)
	]
end

pdf.table items,:width => 540, :cell_style => { :align => :center, :inline_format => true }
pdf.move_down(50)
firmas = [
	["#{@pedido.empleado.nombre} #{@pedido.empleado.apellido}", " "*10,"#{current_user.nombre} #{current_user.apellido}"],
	["<b>#{@pedido.empleado.cargo}</b>"," "*10,"<b>Operador del Sistema</b>"]
]

pdf.table firmas, :width => 540, :cell_style => { :align => :center, :inline_format => true }  do	
	row(0).columns(0).borders = [:top]
	row(0).columns(2).borders = [:top]
	row(0).columns(1).borders = []
	row(1).columns(0..2).borders = []
end