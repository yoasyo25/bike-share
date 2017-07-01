require 'csv'
require './app/models/station.rb'

Station.destroy_all
stations = CSV.open "./db/csv/station.csv", headers: true, header_converters: :symbol

stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city_id: row[:city_id], date_id: row[:date_id])
end
stations.close
