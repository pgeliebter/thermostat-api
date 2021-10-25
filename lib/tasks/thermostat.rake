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
    days_hash = {}
    days = ThermostatPoint.all
    i = 0
    while i < (days.length - 1)
      if days[i + 1].on_off == true && days[i].on_off == true
        # print just the day from a datetime
        day_string = days[i].captured_at.strftime("%Y-%m-%d")
        # check if day_string is in the hash
        if days_hash[day_string]
          # if it is, increment the count
          days_hash[day_string] += days[i + 1].captured_at - days[i].captured_at
        else
          # if not, set the count to 1
          days_hash[day_string] = days[i + 1].captured_at - days[i].captured_at
        end
      end
      i += 1
    end
    items = []

    days_hash.each do |key, value|
      formatted_days_hash = {}
      formatted_days_hash[:day] = key
      formatted_days_hash[:time_on] = value.to_i / 60
      formatted_days_hash[:percentage_on] = (value / 60) / 1440
      items << formatted_days_hash
    end
    Day.import(items)
  end
  desc "TODO"
  task calculate_days2: :environment do
    days = ThermostatPoint.first(2)
    p days[0].captured_at
    p days[1].captured_at
    p days[1].captured_at.min - days[0].captured_at.min
  end
end
