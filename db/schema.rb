# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130730212628) do

  create_table "articulos", :force => true do |t|
    t.string  "codigo",           :limit => 12
    t.string  "nombre",           :limit => 60,                          :null => false
    t.text    "descripcion",      :limit => 255,                         :null => false
    t.string  "unidad_de_medida", :limit => 15,                          :null => false
    t.float   "cantidad",                             :default => 0.0
    t.text    "foto",             :limit => 16777215
    t.integer "familia_id",                                              :null => false
    t.integer "ubicacion_id",                                            :null => false
    t.float   "stock_minimo"
    t.float   "stock_maximo"
    t.boolean "consumible",                           :default => false
  end

  add_index "articulos", ["ubicacion_id"], :name => "articulos_ubicacion_id_fk"

  create_table "articulos_proveedors", :force => true do |t|
    t.integer  "articulo_id"
    t.integer  "proveedor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "articulos_proveedors", ["articulo_id"], :name => "articulos_proveedors_articulo_id_fk"
  add_index "articulos_proveedors", ["proveedor_id"], :name => "articulos_proveedors_proveedor_id_fk"

  create_table "devolucion_has_pedidoshasarticulos", :force => true do |t|
    t.integer  "devolucion_id"
    t.integer  "pedido_has_articulo_id"
    t.integer  "articulo_id"
    t.float    "cantidad"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "devolucion_has_pedidoshasarticulos", ["devolucion_id"], :name => "devolucion_has_pedidoshasarticulos_devolucion_id_fk"
  add_index "devolucion_has_pedidoshasarticulos", ["pedido_has_articulo_id"], :name => "devolucion_has_pedidoshasarticulos_pedido_has_articulo_id_fk"

  create_table "devolucions", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "empleados", :force => true do |t|
    t.string  "cedula",    :limit => 8,   :null => false
    t.string  "nombre",    :limit => 20,  :null => false
    t.string  "apellido",  :limit => 20,  :null => false
    t.string  "direccion", :limit => 120, :null => false
    t.string  "telefono",  :limit => 11,  :null => false
    t.string  "email",     :limit => 35
    t.string  "cargo",     :limit => 80,  :null => false
    t.integer "obra_id",                  :null => false
  end

  create_table "factura_has_articulos", :force => true do |t|
    t.integer "factura_id"
    t.integer "articulo_id"
    t.float   "cantidad"
  end

  add_index "factura_has_articulos", ["articulo_id"], :name => "factura_has_articulos_articulo_id_fk"
  add_index "factura_has_articulos", ["factura_id"], :name => "factura_has_articulos_factura_id_fk"

  create_table "facturas", :force => true do |t|
    t.date     "fecha"
    t.integer  "proveedor_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "facturas", ["proveedor_id"], :name => "facturas_proveedor_id_fk"

  create_table "familias", :force => true do |t|
    t.string "nombre", :limit => 80, :null => false
  end

  create_table "obras", :force => true do |t|
    t.string "nombre", :limit => 120, :null => false
  end

  create_table "pedido_has_articulos", :force => true do |t|
    t.integer  "pedido_id"
    t.integer  "articulo_id"
    t.float    "cantidad"
    t.float    "cantidad_devuelta", :default => 0.0
    t.string   "estado"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "pedido_has_articulos", ["articulo_id"], :name => "pedido_has_articulos_articulo_id_fk"
  add_index "pedido_has_articulos", ["pedido_id"], :name => "pedido_has_articulos_pedido_id_fk"

  create_table "pedidos", :force => true do |t|
    t.string   "estado"
    t.integer  "empleado_id"
    t.integer  "obra_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pedidos", ["empleado_id"], :name => "pedidos_empleado_id_fk"
  add_index "pedidos", ["obra_id"], :name => "pedidos_obra_id_fk"

  create_table "proveedors", :force => true do |t|
    t.string "rif",       :limit => 10
    t.string "nombre",    :limit => 20,  :null => false
    t.string "telefono",  :limit => 11,  :null => false
    t.string "direccion", :limit => 120
    t.string "email",     :limit => 35
    t.string "contacto",  :limit => 25
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tipo_transaccions", :force => true do |t|
    t.string "tipo", :limit => 100, :null => false
  end

  create_table "transaccions", :force => true do |t|
    t.float    "cantidad",                           :null => false
    t.string   "descripcion",         :limit => 200, :null => false
    t.integer  "tipo_transaccion_id",                :null => false
    t.integer  "articulo_id",                        :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "ubicacions", :force => true do |t|
    t.string "nombre", :limit => 80, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nombre",                                 :null => false
    t.string   "apellido",                               :null => false
    t.string   "telefono",                               :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "articulos", "ubicacions", :name => "articulos_ubicacion_id_fk"

  add_foreign_key "articulos", "familias", :name => "articulos_familia_id_fk"

  add_foreign_key "transaccions", "articulos", :name => "transaccions_articulo_id_fk"

  add_foreign_key "articulos_proveedors", "articulos", :name => "articulos_proveedors_articulo_id_fk"
  add_foreign_key "articulos_proveedors", "proveedors", :name => "articulos_proveedors_proveedor_id_fk"

  add_foreign_key "devolucion_has_pedidoshasarticulos", "devolucions", :name => "devolucion_has_pedidoshasarticulos_devolucion_id_fk"
  add_foreign_key "devolucion_has_pedidoshasarticulos", "pedido_has_articulos", :name => "devolucion_has_pedidoshasarticulos_pedido_has_articulo_id_fk"

  add_foreign_key "factura_has_articulos", "articulos", :name => "factura_has_articulos_articulo_id_fk"
  add_foreign_key "factura_has_articulos", "facturas", :name => "factura_has_articulos_factura_id_fk"

  add_foreign_key "facturas", "proveedors", :name => "facturas_proveedor_id_fk"

  add_foreign_key "pedido_has_articulos", "articulos", :name => "pedido_has_articulos_articulo_id_fk"
  add_foreign_key "pedido_has_articulos", "pedidos", :name => "pedido_has_articulos_pedido_id_fk"

  add_foreign_key "pedidos", "empleados", :name => "pedidos_empleado_id_fk"
  add_foreign_key "pedidos", "obras", :name => "pedidos_obra_id_fk"

end
