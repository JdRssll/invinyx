# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
60.times do |i|
	Articulo.create(codigo: i+1, nombre: "Articulo #{i}", unidad_de_medida: "mtrs", familia_id: 1, ubicacion_id: 1, stock_minimo: 2, stock_maximo: 10, cantidad: 0)
end