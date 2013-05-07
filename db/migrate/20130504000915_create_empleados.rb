class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados, {:id => false} do  |t|
      t.string :cedula, :limit => 8, :null => false
      t.string :nombre, :limit => 20, :null => false
      t.string :apellido, :limit => 20, :null => false
      t.string :direccion, :limit => 120, :null => false
      t.string :telefono, :limit => 11, :null => false
      t.string :email, :limit => 35
      t.string :cargo, :limit => 80, :null => false
      t.references  :obra, null: false
    end
    execute "ALTER TABLE empleados ADD PRIMARY KEY (cedula)"
  end
end
