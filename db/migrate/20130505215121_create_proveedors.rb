class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
    	t.string	:rif, :limit => 10
      t.string  :nombre, :limit => 20, :null => false
      t.string	:telefono, :limit => 11, :null => false
      t.string	:direccion, :limit => 120
      t.string	:email, :limit => 35
      t.string  :contacto, :limit => 25
    end
  end
end
