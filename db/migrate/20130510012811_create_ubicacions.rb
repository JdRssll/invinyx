class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.string :nombre, limit: 80, null: false

    end
  end
end
