class BikeDate < ActiveRecord::Base
  has_many :started_trips, class_name: "Trip", foreign_key: :start_date
end
