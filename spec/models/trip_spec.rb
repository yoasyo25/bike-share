RSpec.describe Trip do
  describe "Validations" do

    it "is invalid without a duration" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start date" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end date" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, bike_id: 288,
                          subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, bike_id: 288,
                          subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          subscription_type: "Subscriber", zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription id" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          bike_id: 288, zip_code: 94114)

      expect(trip).to_not be_valid
    end

    it "is valid without a zipcode" do
      city = City.create(city: "San Jose")
      station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: city.id, installation_date: "2017-08-30")
      station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                    city_id: city.id, installation_date: "2017-08-30")
      trip = Trip.create(duration: 174, start_date: "8/29/2013", start_station: station_2.id,
                          end_station: station_1.id, end_date: "8/29/2013",
                          bike_id: 288, subscription_type: "Subscriber")

      expect(trip).to be_valid
    end

    describe "Class methods" do

      before :each do
        @city = City.create(city: "San Jose")
        @station_1 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                        city_id: @city.id, installation_date: "2017-08-30")
        @station_2 = Station.create(name: "San Jose Civic Center", dock_count: 11,
                                      city_id: @city.id, installation_date: "2017-08-30")
        @trip_1 = Trip.create(duration: 100, start_date: "8/29/2013", start_station: @station_2.id,
                            end_station: @station_1.id, end_date: "8/29/2013",
                            bike_id: 288, subscription_type: "Subscriber")
        @trip_2 = Trip.create(duration: 200, start_date: "8/29/2013", start_station: @station_2.id,
                            end_station: @station_1.id, end_date: "8/29/2013",
                            bike_id: 400, subscription_type: "Subscriber")
        @trip_3 = Trip.create(duration: 400, start_date: "8/29/2013", start_station: @station_1.id,
                            end_station: @station_2.id, end_date: "8/29/2013",
                            bike_id: 288, subscription_type: "Subscriber")
        @trip_4 = Trip.create(duration: 300, start_date: "8/29/2013", start_station: @station_2.id,
                            end_station: @station_1.id, end_date: "8/29/2013",
                            bike_id: 288, subscription_type: "Subscriber")
      end

      it "shows the average duration of a ride" do
        average = Trip.average_duration_of_a_ride

        expect(average).to eq(250)
      end

      it "shows the longest ride taken" do
        longest = Trip.longest_duration_of_a_ride

        expect(longest).to eq(400)
      end

      it "shows the shortest ride taken" do
        shortest = Trip.shortest_duration_of_a_ride

        expect(shortest).to eq(100)
      end

      it "shows the station where the most rides started" do
        most_rides_begun = Trip.start_station_with_most_rides

        expect(most_rides_begun).to eq(@station_2)
      end

      it "shows the station where the most rides started" do
        most_rides_ending = Trip.end_station_with_most_rides

        expect(most_rides_ending).to eq(@station_1)
      end

      it "shows month by month breakdown of rides wiht subtotals for each year" do
        monthly_breakdown_of_rides_per_year = Trip.monthly_subtotal_of_trips_per_year

        expect(monthly_breakdown_of_rides_per_year).to eq("?????")
      end


      # User subscription type breakout with both count and percentage.
      # Single date with the highest number of trips with a count of those trips.
      # Single date with the lowest number of trips with a count of those trips.

    end
  end
end
