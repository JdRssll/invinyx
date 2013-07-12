class CreateDevoluciones < ActiveRecord::Migration
  def change
    create_table :devoluciones do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
