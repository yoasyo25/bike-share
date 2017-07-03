RSpec.describe Bike do

  before :each do
    @bike_1 = Bike.create
  end

  describe "Validations" do

    it "is invalid without an id" do
      bike = Bike.create

      expect(bike).to_not be_valid
    end

  describe "Class methods" do

    it "shows most ridden bike" do
      most_ridden_bike = Bike.most_ridden_bike

      expect(most_ridden_bike).to eq("????")
    end

    it "it shows total number of rides for most ridden bike" do
      total_rides = Bike.total_rides_for_most_ridden_bike

      expect(total_rides).to eq("????")
    end

    it "it shows least ridden bike" do
      least_ridden_bike = Bike.least_ridden_bike

      expect(least_ridden_bike).to eq("?????")
    end

    it "it shows total number of rides for least ridden bike" do
      total_rides = Bike.total_rides_for_least_ridden_bike

      expect(total_rides).to eq("?????")
    end
    
  end
