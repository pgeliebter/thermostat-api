namespace :thermostat do
  desc "TODO"
  task import_csv: :environment do
    items = []
    CSV.foreach("feeds2.csv", headers: true) do |row|
      items << row.to_h
    end
    ThermostatPoint.import(items)
  end

  desc "TODO"
  task calculate_days: :environment do
  end
end
