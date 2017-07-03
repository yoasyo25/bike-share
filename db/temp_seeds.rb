require 'csv'
require './app/models/station.rb'
require './app/models/city.rb'

City.destroy_all
Station.destroy_all

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each { |row| values << row.to_h}
  values
end

def seed_city_database(file_path)
  csv = from_csv(file_path)
  cities = csv.each do |row|
    row.keep_if {|key, value| key == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end

def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |station|
    city = City.find_by(city: station[:city])
    station.delete_if {|key, value| key == :lat || key == :long || key == :city || key == :id}
    station[:installation_date] = DateTime.strptime(station[:installation_date], "%m/%d/%Y").strftime("%F")
    city.stations.create(station)
  end
end


def seed_subscription_database(file_path)
  csv = from_csv(file_path)
  subscriptions = csv.each do |row|
    row.keep_if {|key, value| key == :subscription_type}
  end
  subscriptions.uniq.each {|subscription| Subscription.create!(subscription)}
end

def seed_dates_database(file_path)
  csv = from_csv(file_path)
  dates = csv.each do |row|
    row.keep_if {|key, value| key == :start_date || key == :end_date}
  end
  dates.uniq.each {|date| BikeDate.create!(date)}
end

def seed_trips_database
  trips = from_csv(file_path)
  trips.each do |trip|

    start_date = BikeDate.find_by(date: trip[:start_date])
    start_station = Station.find_by(name: trip[:start_station])
    end_date = BikeDate.find_by(date: trip[:end_date])
    end_station = Station.find_by(name: trip[:end_station])
    subscription_type = Subscription.find_by(subscription_type: trip[:subscription_type])

    trip[:start_date] = DateTime.strptime(trip[:start_date], "%m/%d/%Y")
    trip[:end_date] = DateTime.strptime(trip[:end_date], "%m/%d/%Y")

    new_trip = Trip.create!(trip)

    start_date.trips << new_trip
    end_date.trips << new_trip
    subscription_type.trips << new_trip
  end
end

seed_city_database("./db/csv/station.csv")
seed_station_database("./db/csv/station.csv")
seed_subscription_database("./db/csv/trip.csv")
seed_dates_database("./db/csv/trip.csv")
seed_trips_database("./db/csv/trip.csv")
