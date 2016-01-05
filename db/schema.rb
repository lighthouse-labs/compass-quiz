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

ActiveRecord::Schema.define(version: 20160105030608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "day"
    t.string   "title"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "compass_install"
    t.integer  "compass_primary_key"
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "answers", ["option_id"], name: "index_answers_on_option_id", using: :btree
  add_index "answers", ["submission_id"], name: "index_answers_on_submission_id", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "compass_install"
    t.integer  "compass_primary_key"
  end

  create_table "options", force: :cascade do |t|
    t.text     "answer"
    t.text     "explanation"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "question_quizzes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "quiz_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_quizzes", ["question_id"], name: "index_question_quizzes_on_question_id", using: :btree
  add_index "question_quizzes", ["quiz_id"], name: "index_question_quizzes_on_quiz_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.boolean  "active",      default: true
    t.integer  "activity_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "questions", ["activity_id"], name: "index_questions_on_activity_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "day"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quizzes", ["cohort_id"], name: "index_quizzes_on_cohort_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "github_username"
    t.integer  "cohort_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "compass_primary_key"
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "submissions", ["quiz_id"], name: "index_submissions_on_quiz_id", using: :btree
  add_index "submissions", ["student_id"], name: "index_submissions_on_student_id", using: :btree

  add_foreign_key "answers", "options"
  add_foreign_key "answers", "submissions"
  add_foreign_key "options", "questions"
  add_foreign_key "question_quizzes", "questions"
  add_foreign_key "question_quizzes", "quizzes"
  add_foreign_key "questions", "activities"
  add_foreign_key "quizzes", "cohorts"
  add_foreign_key "students", "cohorts"
  add_foreign_key "submissions", "quizzes"
  add_foreign_key "submissions", "students"
end
