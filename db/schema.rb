# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_23_062650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "element_types", force: :cascade do |t|
    t.string "column_name"
    t.string "before_word_support", default: ""
    t.string "after_word_support", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string "search_word"
    t.string "before_word", default: ""
    t.string "after_word", default: ""
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "element_type_id"
    t.index ["element_type_id"], name: "index_slides_on_element_type_id"
    t.index ["user_id"], name: "index_slides_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
