class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :estado
      t.integer :empleado_id
      t.integer :obra_id

      t.timestamps
    end
    add_foreign_key(:pedidos, :obras, options: 'ON DELETE RESTRICT')
    add_foreign_key(:pedidos, :empleados)
  end
end
