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

ActiveRecord::Schema[7.0].define(version: 2022_09_27_092324) do
  create_table "attachments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "communication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["communication_id"], name: "attachments_communication_communications_reference"
  end

  create_table "communications", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "receiver_id", null: false
    t.string "subject"
    t.text "contents"
    t.bigint "previous_communication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "communications_creator_people_reference"
    t.index ["previous_communication_id"], name: "previous_communication_reference"
    t.index ["receiver_id"], name: "communications_receiver_people_reference"
  end

  create_table "people", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthdate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attachments", "communications"
  add_foreign_key "communications", "communications", column: "previous_communication_id"
  add_foreign_key "communications", "people", column: "creator_id"
  add_foreign_key "communications", "people", column: "receiver_id"
end
