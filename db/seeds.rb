# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
	Articulo.create(codigo: i+1, nombre: "Articulo #{i}", unidad_de_medida: "Mts", familia_id: 1, ubicacion_id: 1, cantidad: 0, stock_maximo: 50, stock_minimo: 5)
end
User.create(nombre: "Gabriel", apellido: "Morillo", telefono: "02692562618", email: "usuario@email.com", password: "12345678", password_confirmation: "12345678")
Familia.create(nombre: "General")
Ubicacion.create(nombre: "General")
Obra.create(nombre: "Amuay")