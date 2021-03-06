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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171112000147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "wasm_filename"
    t.string   "wasm_content_type"
    t.binary   "wasm_file_contents"
    t.string   "js_filename"
    t.string   "js_content_type"
    t.binary   "js_file_contents"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "results", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.integer  "task_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "results", ["task_id"], name: "index_results_on_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.integer  "project_id"
    t.integer  "times_executed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  add_foreign_key "results", "tasks"
  add_foreign_key "tasks", "projects"
end
