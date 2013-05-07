class CreateTipoTransaccions < ActiveRecord::Migration
  def change
    create_table :tipo_transaccions do |t|
      t.string :tipo, :limit => 100, :null => false

      t.timestamps
    end
  end
end
