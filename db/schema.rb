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

ActiveRecord::Schema.define(version: 20190424163514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "litters", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "breed"
    t.string "image", default: "http://2r.co.za/wp-content/uploads/2016/08/no-image-yet.png"
  end

  create_table "parent_litters", force: :cascade do |t|
    t.bigint "litter_id"
    t.bigint "parent_id"
    t.index ["litter_id"], name: "index_parent_litters_on_litter_id"
    t.index ["parent_id"], name: "index_parent_litters_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "registration"
    t.string "genetics"
    t.string "role"
    t.string "image", default: "http://2r.co.za/wp-content/uploads/2016/08/no-image-yet.png"
  end

  create_table "puppers", force: :cascade do |t|
    t.string "gender"
    t.boolean "sold", default: false
    t.bigint "litter_id"
    t.string "image", default: "http://2r.co.za/wp-content/uploads/2016/08/no-image-yet.png"
    t.index ["litter_id"], name: "index_puppers_on_litter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parent_litters", "litters"
  add_foreign_key "parent_litters", "parents"
end
