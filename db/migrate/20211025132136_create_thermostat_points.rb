class CreateThermostatPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :thermostat_points do |t|
      t.datetime :captured_at
      t.integer :entry_id
      t.boolean :on_off
      t.timestamps
    end
  end
end
