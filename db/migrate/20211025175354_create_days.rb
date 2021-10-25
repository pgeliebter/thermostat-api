class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.date :day
      t.string :name
      t.decimal :percentage_on, precision: 9, scale: 2
      t.time :time_on

      t.timestamps
    end
  end
end
