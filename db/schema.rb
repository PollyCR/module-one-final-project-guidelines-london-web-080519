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

ActiveRecord::Schema.define(version: 5) do

  create_table "articles", force: :cascade do |t|
    t.integer "source_id"
    t.string "author"
    t.string "title"
    t.string "description"
    t.text "url"
    t.text "url_to_image"
    t.datetime "published_at"
    t.text "content"
    t.integer "source_id"
  end

  create_table "favorite_articles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.integer "source_id"
  end

  create_table "favorite_sources", force: :cascade do |t|
    t.integer "user_id"
    t.integer "source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "source_code"
    t.string "name"
    t.string "description"
    t.string "url"
    t.string "category"
    t.string "language"
    t.string "country"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
