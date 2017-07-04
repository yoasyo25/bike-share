class Trip < ActiveRecord::Base
  belongs_to :starting_station, :class_name => "Station", :foreign_key => :start_station
  belongs_to :starting_date, :class_name => "BikeDate", :foreign_key => :start_date
  belongs_to :ending_station, :class_name => "Station", :foreign_key => :end_station
  belongs_to :ending_date, :class_name => "BikeDate", :foreign_key => :end_date
  belongs_to :bike, :class_name => "Bike", :foreign_key => :bike_id
  belongs_to :subscription, :class_name => "Subscription", :foreign_key => :subscription_type
  belongs_to :zip, :class_name => "ZipCode", :foreign_key => :zip_code
end
