class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha
      t.string  :proveedor_id, null: false

      t.timestamps
    end
  end
end
