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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171119154255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_back_responses", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fetched_sales_orders", force: :cascade do |t|
    t.integer  "woocommerce_sales_order_id"
    t.json     "body"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_primary_lines", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "inventory_id"
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.string   "qtty"
    t.decimal  "average_inventory_value_per_unit", precision: 11, scale: 4, default: "0.0"
    t.index ["inventory_id"], name: "index_inventory_primary_lines_on_inventory_id", using: :btree
    t.index ["product_id"], name: "index_inventory_primary_lines_on_product_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal  "amount_in_invoice_currency",    precision: 11, scale: 4
    t.string   "invoice_currency"
    t.decimal  "amount_in_accounting_currency", precision: 11, scale: 4
    t.string   "reference"
    t.string   "url"
    t.date     "issue_date"
    t.date     "due_date"
    t.date     "payment_date"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "order_id"
    t.string   "document"
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "qtty"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",                                                                            null: false
    t.datetime "updated_at",                                                                            null: false
    t.decimal  "production_cost_per_unit_invoice_currency",    precision: 11, scale: 4
    t.decimal  "production_cost_per_unit_accounting_currency", precision: 11, scale: 4
    t.decimal  "total_costs_per_unit",                         precision: 11, scale: 4, default: "0.0"
    t.date     "arrival_in_stock_date"
    t.index ["order_id"], name: "index_order_lines_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.integer  "qtty"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "purchase_or_production_invoice_currency"
    t.string   "purchase_or_production_invoice_reference"
    t.decimal  "additional_costs_per_unit",                precision: 11, scale: 4
    t.decimal  "additional_costs",                         precision: 11, scale: 4
    t.date     "arrival_in_stock_date"
  end

  create_table "products", force: :cascade do |t|
    t.string   "SKU"
    t.string   "name"
    t.string   "size"
    t.string   "color"
    t.string   "structure"
    t.string   "category"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "parentSKU"
    t.integer  "supplier_id"
    t.integer  "heal_thickness"
    t.boolean  "platform"
    t.string   "material"
    t.string   "heal_height"
    t.string   "closing_type"
    t.bigint   "EAN"
    t.string   "woocommerce_product_id"
  end

  create_table "purchase_order_draft_lines", force: :cascade do |t|
    t.integer  "purchase_order_draft_id"
    t.string   "SKU"
    t.integer  "qtty_in_stock"
    t.integer  "order_qtty"
    t.integer  "sold_in_supply_period_days"
    t.integer  "days_of_sales_after_order"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "days_out_of_stock"
    t.float    "sales_speed"
    t.integer  "qtty_after_order"
    t.integer  "status",                     default: 0
    t.text     "comments"
    t.integer  "product_id"
    t.index ["purchase_order_draft_id"], name: "index_purchase_order_draft_lines_on_purchase_order_draft_id", using: :btree
  end

  create_table "purchase_order_drafts", force: :cascade do |t|
    t.string   "name"
    t.integer  "supply_period_days"
    t.integer  "inventory_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "supplier_id"
    t.index ["inventory_id"], name: "index_purchase_order_drafts_on_inventory_id", using: :btree
  end

  create_table "sales_order_lines", force: :cascade do |t|
    t.datetime "date"
    t.integer  "qtty"
    t.string   "SKU"
    t.string   "woocommerce_order_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "company"
    t.string   "accounting_currency"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "inventory_primary_lines", "inventories"
  add_foreign_key "inventory_primary_lines", "products"
  add_foreign_key "invoices", "orders"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "products", "suppliers"
  add_foreign_key "purchase_order_draft_lines", "products"
  add_foreign_key "purchase_order_draft_lines", "purchase_order_drafts"
  add_foreign_key "purchase_order_drafts", "inventories"
  add_foreign_key "purchase_order_drafts", "suppliers"
end
