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

ActiveRecord::Schema.define(version: 20170512082752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.decimal "runtime"
    t.decimal "rating"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating"], name: "index_movies_on_rating"
    t.index ["title"], name: "index_movies_on_title"
    t.index ["year"], name: "index_movies_on_year"
  end

  create_table "torrents", force: :cascade do |t|
    t.text "url"
    t.text "hash"
    t.string "quality"
    t.decimal "size"
    t.integer "seeds"
    t.integer "peers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peers"], name: "index_torrents_on_peers"
    t.index ["seeds"], name: "index_torrents_on_seeds"
  end

  create_table "torrents_movies", force: :cascade do |t|
    t.bigint "torrent_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_torrents_movies_on_movie_id"
    t.index ["torrent_id"], name: "index_torrents_movies_on_torrent_id"
  end

  add_foreign_key "genres_movies", "genres"
  add_foreign_key "genres_movies", "movies"
  add_foreign_key "torrents_movies", "movies"
  add_foreign_key "torrents_movies", "torrents"
end
