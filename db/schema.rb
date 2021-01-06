ActiveRecord::Schema.define(version: 2020_01_06_253651) do
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_albums_on_email", unique: true
  end

  create_table "feeds", force: :cascade do |t|
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.bigint "album_id"
    t.index ["album_id"], name: "index_feeds_on_album_id"
  end

  add_foreign_key "albums", "feeds"
end
