class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha
      t.references  :proveedor, null: false

      t.timestamps
    end
  end
end
