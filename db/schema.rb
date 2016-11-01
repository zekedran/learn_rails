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

ActiveRecord::Schema.define(version: 20161026175339) do

  create_table "add_on_links", force: :cascade do |t|
    t.integer  "add_on_id"
    t.integer  "add_on_type_link_id"
    t.decimal  "price"
    t.boolean  "selected"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["add_on_id", "add_on_type_link_id"], name: "index_add_on_links_on_add_on_id_and_add_on_type_link_id", unique: true
    t.index ["add_on_id"], name: "index_add_on_links_on_add_on_id"
    t.index ["add_on_type_link_id"], name: "index_add_on_links_on_add_on_type_link_id"
  end

  create_table "add_on_type_links", force: :cascade do |t|
    t.integer  "add_on_type_id"
    t.string   "addonable_type"
    t.integer  "addonable_id"
    t.integer  "min",            default: 0
    t.integer  "max"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["add_on_type_id"], name: "index_add_on_type_links_on_add_on_type_id"
    t.index ["addonable_type", "addonable_id"], name: "index_add_on_type_links_on_addonable_type_and_addonable_id"
  end

  create_table "add_on_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "add_ons", force: :cascade do |t|
    t.string   "name"
    t.integer  "add_on_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["add_on_type_id"], name: "index_add_ons_on_add_on_type_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "line1"
    t.string   "line2"
    t.integer  "location_id"
    t.string   "mobile"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_addresses_on_location_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "business_name"
    t.string   "logo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["business_name"], name: "index_brands_on_business_name", unique: true
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "combos", force: :cascade do |t|
    t.string   "name"
    t.decimal  "discount",   default: "0.0"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["name"], name: "index_combos_on_name", unique: true
  end

  create_table "combos_dishes", id: false, force: :cascade do |t|
    t.integer "combo_id", null: false
    t.integer "dish_id",  null: false
    t.index ["combo_id", "dish_id"], name: "index_combos_dishes_on_combo_id_and_dish_id"
    t.index ["dish_id", "combo_id"], name: "index_combos_dishes_on_dish_id_and_combo_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "available"
    t.integer  "used"
    t.integer  "user_id"
    t.boolean  "affects_surcharges"
    t.decimal  "amount"
    t.decimal  "min_cart_value"
    t.decimal  "percentage"
    t.decimal  "max_amount"
    t.datetime "expiry"
    t.string   "couponable_type"
    t.integer  "couponable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["couponable_type", "couponable_id"], name: "index_coupons_on_couponable_type_and_couponable_id"
    t.index ["name"], name: "index_coupons_on_name", unique: true
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cuisines_on_name", unique: true
  end

  create_table "cuisines_dishes", id: false, force: :cascade do |t|
    t.integer "cuisine_id", null: false
    t.integer "dish_id",    null: false
    t.index ["cuisine_id", "dish_id"], name: "index_cuisines_dishes_on_cuisine_id_and_dish_id"
    t.index ["dish_id", "cuisine_id"], name: "index_cuisines_dishes_on_dish_id_and_cuisine_id"
  end

  create_table "cuisines_restaurants", id: false, force: :cascade do |t|
    t.integer "cuisine_id",    null: false
    t.integer "restaurant_id", null: false
    t.index ["cuisine_id", "restaurant_id"], name: "index_cuisines_restaurants_on_cuisine_id_and_restaurant_id"
    t.index ["restaurant_id", "cuisine_id"], name: "index_cuisines_restaurants_on_restaurant_id_and_cuisine_id"
  end

  create_table "dish_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_dish_categories_on_name", unique: true
  end

  create_table "dish_variants", force: :cascade do |t|
    t.decimal  "price"
    t.string   "image"
    t.string   "icon"
    t.integer  "dish_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "food_label_id"
    t.integer  "variant_id"
    t.index ["dish_id"], name: "index_dish_variants_on_dish_id"
    t.index ["food_label_id"], name: "index_dish_variants_on_food_label_id"
    t.index ["variant_id"], name: "index_dish_variants_on_variant_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "restaurant_id"
    t.boolean  "available"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "dish_category_id"
    t.index ["dish_category_id"], name: "index_dishes_on_dish_category_id"
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "feel_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_feel_categories_on_name", unique: true
  end

  create_table "feel_links", force: :cascade do |t|
    t.string   "feelable_type"
    t.integer  "feelable_id"
    t.integer  "feel_id"
    t.integer  "scale",         default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["feel_id"], name: "index_feel_links_on_feel_id"
    t.index ["feelable_type", "feelable_id"], name: "index_feel_links_on_feelable_type_and_feelable_id"
  end

  create_table "feels", force: :cascade do |t|
    t.string   "name"
    t.integer  "feel_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["feel_category_id"], name: "index_feels_on_feel_category_id"
    t.index ["name"], name: "index_feels_on_name", unique: true
  end

  create_table "food_labels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_food_labels_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "packaging_centre_id"
    t.integer  "city_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["name"], name: "index_locations_on_name", unique: true
    t.index ["packaging_centre_id"], name: "index_locations_on_packaging_centre_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "purchasable_type"
    t.integer  "purchasable_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["purchasable_type", "purchasable_id"], name: "index_order_items_on_purchasable_type_and_purchasable_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_order_statuses_on_name", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.integer  "address_id"
    t.integer  "coupon_id"
    t.decimal  "sub_total"
    t.decimal  "delivery"
    t.decimal  "vat"
    t.decimal  "total"
    t.integer  "payment_method_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "packaging_centres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_packaging_centres_on_name", unique: true
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_payment_methods_on_name", unique: true
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_phone_types_on_name", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.integer  "stars",      default: 5
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["dish_id"], name: "index_ratings_on_dish_id"
    t.index ["user_id", "dish_id"], name: "index_ratings_on_user_id_and_dish_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "restaurant_phones", force: :cascade do |t|
    t.integer  "phone_type_id"
    t.string   "value"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["phone_type_id"], name: "index_restaurant_phones_on_phone_type_id"
    t.index ["restaurant_id"], name: "index_restaurant_phones_on_restaurant_id"
  end

  create_table "restaurant_timings", force: :cascade do |t|
    t.time     "opening_time"
    t.time     "closing_time"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_restaurant_timings_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "email"
    t.string   "address_line1"
    t.string   "address_line2"
    t.integer  "location_id"
    t.integer  "brand_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["brand_id"], name: "index_restaurants_on_brand_id"
    t.index ["location_id"], name: "index_restaurants_on_location_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            default: "", null: false
    t.string   "email",           default: "", null: false
    t.string   "mobile",          default: "", null: false
    t.string   "image"
    t.string   "password_digest"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "variant_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_variant_categories_on_name", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "variant_category_id"
    t.index ["name"], name: "index_variants_on_name", unique: true
    t.index ["variant_category_id"], name: "index_variants_on_variant_category_id"
  end

end
