class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :estado
      t.integer :empleado_id

      t.timestamps
    end
  end
end
