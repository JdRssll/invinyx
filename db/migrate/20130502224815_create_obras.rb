class CreateObras < ActiveRecord::Migration
  def change
    create_table :obras do |t|
<<<<<<< HEAD
      t.string :nombre, :limit => 120, :null => false
=======
      t.string :nombre, :limit => 60, :null => :false

      t.timestamps
>>>>>>> obra
    end
  end
end
