class ChangeTimeOnToIntegerInDays < ActiveRecord::Migration[6.1]
  def change
    remove_column :days, :time_on
    add_column :days, :time_on, :integer
  end
end
