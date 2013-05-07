class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transaccions do |t|
      t.float :cantidad, :null => false
      t.string :descripcion, :limit => 200, :null => false
      t.references  :tipo_transaccion, null: false
      t.timestamps
    end
  end
end
