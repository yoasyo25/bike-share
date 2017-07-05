class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.integer :start_date
      t.belongs_to :station, foreign_key: true
      t.integer :end_date
      t.integer :end_station
      t.integer :bike_id
      t.integer :subscription_type
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
