class Condition < ActiveRecord::Base
  belongs_to :bikedate, :class_name => "BikeDate", :foreign_key => :date_id
  validates :date_id, presence: true
  validates :max_temp, presence: true
  validates :mean_temp, presence: true
  validates :min_temp, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility, presence: true
  validates :mean_wind_speed, presence: true
  validates :precipitation, presence: true
end
