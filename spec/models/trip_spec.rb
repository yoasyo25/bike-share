RSpec.describe Trip do
  before :each do
    @city_1 = City.create(city: "San Jose")
    @city_2 = City.create(city: "Redwood")

    @start_date = BikeDate.create(date: "5/4/2014 10:16")
    @end_date = BikeDate.create(date: "5/4/2014 12:16")

    @start_station = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
    @end_station = Station.create(name: "San Pedro", dock_count: 11,
    city_id: @city_2.id, installation_date: "2017-08-30")

    @bike_id = Bike.create(bike: 1)

    @subscription_type = Subscription.create(subscription_type: "Customer")

    @zip_code = ZipCode.create(zip_code: 99999)

    @trip_1 = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_2 = Trip.create(duration: 200, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_3 = Trip.create(duration: 400, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_4 = Trip.create(duration: 300, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)
  end

  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: @start_date.id, start_station: @start_station.id,
        end_station: @end_station.id, end_date: @end_date.id,
        bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end
  end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 100, start_station: @start_station.id,
        end_station: @end_station.id, end_date: @end_date.id,
        bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, end_date: @end_date.id,
        end_station: @end_station.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_date: @end_date.id, bike_id: @bike_id.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, subscription_type: @subscription_type.id,
      zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription id" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, end_date: @end_date.id,
      bike_id: @bike_id.id, zip_code: @zip_code.id)

      expect(trip).to_not be_valid
    end

    it "is valid without a zipcode" do
      trip = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
      end_station: @end_station.id, end_date: @end_date.id, bike_id: @bike_id.id,
      subscription_type: @subscription_type.id)

      expect(trip).to be_valid
    end

    describe "Class methods" do
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

        expect(most_rides_begun).to eq(@start_station.name)
      end
    #
    #   it "shows the station where the most rides started" do
    #     most_rides_ending = Trip.end_station_with_most_rides
    #
    #     expect(most_rides_ending).to eq(@end_station)
    #   end
    #
    #   it "shows month by month breakdown of rides wiht subtotals for each year" do
    #     monthly_breakdown_of_rides_per_year = Trip.monthly_subtotal_of_trips_per_year
    #
    #     expect(monthly_breakdown_of_rides_per_year).to eq("?????")
    #   end


  end
end
