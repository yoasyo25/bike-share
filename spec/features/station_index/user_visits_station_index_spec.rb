RSpec.describe "User visits station index page" do
  it "sees link back to home page" do
    # When I visit the station index page
    visit '/stations'
    # I should see a link back to the home page
    page.should have_selector(:link_or_button, 'Home')
  end

  it "sees a list of stations" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    # When I visit the station index page
    visit '/stations'
    # I should see a list of all stations
    page.should have_selector(:link_or_button, 'One')
  end

  it "sees an edit button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    # I should see an edit button for each station
    page.should have_selector(:link_or_button, 'Edit')
  end

  it "sees a delete button for each station" do
    station = Station.create(name: "One", dock_count: 1, city_id: 1, installation_date: "2017-08-30")
    visit '/stations'
    # page.should have_selector(:link_or_button, 'Delete')
    expect(page).to have_button('Delete')
  end


end
