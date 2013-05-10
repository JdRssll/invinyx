class CreateFamilia < ActiveRecord::Migration
  def change
    create_table :familia do |t|
      t.string :nombre, limit: 80, null: false

    end
  end
end
