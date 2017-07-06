RSpec.describe "User visits trip dashboard and" do

  it "sees average duration of a ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Average duration of a ride")
  end

  it "sees longest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Longest Ride")
  end

  it "sees shortest ride" do
    visit '/trips-dashboard'

    expect(page).to have_content("Shortest Ride")
  end

  it "sees the station that had the most beginning rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Beginning @")
  end

  it "sees the station that most rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Stations With Most Rides Ending @")
  end

  it "sees monthly breakdown of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Monthly breakdown")
  end

  it "sees most ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Most Ridden Bike")
  end

  it "sees most least ridden bike" do
    visit '/trips-dashboard'

    expect(page).to have_content("Least Ridden Bike")
  end

  it "sees user subscription type and breakdown" do
    visit '/trips-dashboard'

    expect(page).to have_content("Subscription")
  end

  it "sees date with highest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Highest Number of Rides")
  end

  it "sees date with lowest number of rides" do
    visit '/trips-dashboard'

    expect(page).to have_content("Lowest Number of Rides")
  end
end
