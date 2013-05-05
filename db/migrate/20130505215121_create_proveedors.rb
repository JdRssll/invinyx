class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors, {:id => false} do |t|
    	t.string	:rif, :limit => 10, :null => false  
      t.string  :nombre, :limit => 20, :null => false
      t.string	:telefono, :limit => 11, :null => false
      t.string	:direccion, :limit => 120, :null => false
      t.string	:email, :limit => 35, :null => false
    end
    execute "ALTER TABLE proveedors ADD PRIMARY KEY (rif)"
  end
end
