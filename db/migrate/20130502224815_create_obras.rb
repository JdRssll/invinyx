class CreateObras < ActiveRecord::Migration
  def change
    create_table :obras do |t|
      t.string :nombre, :limit => 120, :null => false
    end
  end
end
