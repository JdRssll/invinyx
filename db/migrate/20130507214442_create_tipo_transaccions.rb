class CreateTipoTransaccions < ActiveRecord::Migration
  def change
    create_table :tipo_transaccions do |t|
      t.string :tipo, :limit => 100, :null => false

      #t.timestamps
    end
    execute "INSERT INTO tipo_transaccions (tipo) VALUES ('Entrada')"
  	execute "INSERT INTO tipo_transaccions (tipo) VALUES ('Salida')"
  end
end
