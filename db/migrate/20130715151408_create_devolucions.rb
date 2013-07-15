class CreateDevolucions < ActiveRecord::Migration
  def change
    create_table :devolucions do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
