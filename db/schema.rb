# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_15_190911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_materials", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "project_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_project_materials_on_material_id"
    t.index ["project_id"], name: "index_project_materials_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
  end

  add_foreign_key "project_materials", "materials"
  add_foreign_key "project_materials", "projects"
  add_foreign_key "projects", "users"
end
