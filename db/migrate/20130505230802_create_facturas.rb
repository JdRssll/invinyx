class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha
      t.integer  :proveedor_id, null: false

      t.timestamps
    end    
    add_foreign_key(:facturas, :proveedors)
  end
end
