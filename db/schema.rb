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

ActiveRecord::Schema.define(version: 20180713103342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_streams", force: :cascade do |t|
    t.integer "stream_id"
    t.string "language"
    t.integer "sample_rate"
    t.string "format"
    t.bigint "video_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_datum_id"], name: "index_audio_streams_on_video_datum_id"
  end

  create_table "caption_streams", force: :cascade do |t|
    t.integer "stream_id"
    t.string "language"
    t.bigint "video_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_datum_id"], name: "index_caption_streams_on_video_datum_id"
  end

  create_table "video_data", force: :cascade do |t|
    t.string "name"
    t.float "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_streams", force: :cascade do |t|
    t.integer "stream_id"
    t.integer "bitrate"
    t.float "fps"
    t.string "resolution"
    t.bigint "video_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_datum_id"], name: "index_video_streams_on_video_datum_id"
  end

  add_foreign_key "audio_streams", "video_data"
  add_foreign_key "caption_streams", "video_data"
  add_foreign_key "video_streams", "video_data"
end
