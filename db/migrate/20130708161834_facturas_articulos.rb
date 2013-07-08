class CreateArticulosFacturasJoinTable < ActiveRecord::Migration
  def change
  	create_table :articulos_facturas, :id => false do |t|
      t.belongs_to :articulo
      t.belongs_to :factura
      t.float :cantidad
    end
  end

end
