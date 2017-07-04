RSpec.describe "User visits station dashboard and" do
  it "sees total stations" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("Total Stations")
  end

  it "sees average bikes per station" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("Average Bikes/Station")
  end

  it "sees Stations with most bikes" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("Stations With Most Bikes")
  end

  it "sees stations with least bikes" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("Stations with least Bikes")
  end

  it "sees Most recent installed stations" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("Is the newest Station")
  end

  it "sees Oldest Station" do
    # When I visit the station dashboard page
    visit '/stations/station-dashboard'
    # I should see a total number of stations
    expect(page).to have_content("are the oldest stations")
  end

end
