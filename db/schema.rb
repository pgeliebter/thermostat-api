ActiveRecord::Schema.define(version: 2021_10_25_132136) do
  enable_extension "plpgsql"

  create_table "thermostat_points", force: :cascade do |t|
    t.datetime "captured_at"
    t.integer "entry_id"
    t.boolean "on_off"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
