

ActiveRecord::Schema[7.1].define(version: 2024_04_29_154733) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
