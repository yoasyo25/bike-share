RSpec.describe "User visits station index page" do
  it "sees link back to home page" do
    # When I visit the station index page
    visit '/stations'
    # I should see a link back to the home page
    page.should have_selector(:link_or_button, 'Home')
  end

  it "sees a list of stations" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "08/30/17")
    station_two = Station.create(name: "Two", dock_count: 1, city_id: 1, installation_date: "08/30/17")
    # When I visit the station index page
    visit '/stations'
    # I should see a list of all stations
    expect(page).to have_content("One")
  end

  it "sees an edit button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "08/30/17")
    visit '/stations'
    # I should see an edit button for each station
    page.should have_selector(:link_or_button, 'Edit')
  end

  it "sees a delete button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "08/30/17")
    visit '/stations'
    page.should have_selector(:link_or_button, 'Delete')
  end

end
