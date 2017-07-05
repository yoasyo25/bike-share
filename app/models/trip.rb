class Trip < ActiveRecord::Base
  belongs_to :starting_station, :class_name => "Station", :foreign_key => :start_station
  belongs_to :starting_date, :class_name => "BikeDate", :foreign_key => :start_date
  belongs_to :ending_station, :class_name => "Station", :foreign_key => :end_station
  belongs_to :ending_date, :class_name => "BikeDate", :foreign_key => :end_date
  belongs_to :bike, :class_name => "Bike", :foreign_key => :bike_id
  belongs_to :subscription, :class_name => "Subscription", :foreign_key => :subscription_type
  belongs_to :zip, :class_name => "ZipCode", :foreign_key => :zip_code

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true


  def self.average_duration_of_a_ride
    average(:duration)
  end

  def self.longest_duration_of_a_ride
    maximum(:duration)
  end

  def self.shortest_duration_of_a_ride
    minimum(:duration)
  end


  def self.start_station_with_most_rides
    trip_by_station = Trip.group(:start_station).count
    most_trips = trip_by_station.max_by {|k,v| v}
    Station.find(most_trips[0]).name
  end

  def self.end_station_with_most_rides
    trip_by_station = Trip.group(:end_station).count
    most_trips = trip_by_station.max_by {|k,v| v}
    Station.find(most_trips[0]).name
    # Station with the most rides as an ending place.
  end

  def self.monthly_subtotal_of_trips_per_year
    # Month by Month breakdown of number of rides with subtotals for each year.
  end


end
