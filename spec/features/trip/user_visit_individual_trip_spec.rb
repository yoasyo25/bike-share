RSpec.describe "User visits an individual trip" do
  it "sees a page with a the Duration of the Trip" do

    visit '/trips/1'

    expect(page).to have_content("Duration")
    expect(page).to have_content("Start Date")
    expect(page).to have_content("Start Station")
    expect(page).to have_content("End Date")
    expect(page).to have_content("End Station")
    expect(page).to have_content("Bike")
    expect(page).to have_content("Subscription Type")
  end

  it "clicks on home and expects to see home page" do
    visit '/trips/1'
    find_link("Home").click

    expect(current_path).to eq(/)
  end

  it "clicks on All Stations and expects to see Station Index page" do
    visit '/trips/1'
    find_link("All Stations").click

    expect(current_path).to eq(/stations)
  end

  it "clicks on home and expects to see Trips Index page" do
    visit '/trips/1'
    find_link("All Trips").click

    expect(current_path).to eq(/trips)
  end

  it "clicks on edit and expects to see Edit page" do
    visit '/trips/1'
    find_link("Edit").click

    expect(current_path).to eq(/trips/edit)
  end

  it "clicks on delete and expects to see home page" do
    visit '/trips/1'
    find_link("Delete").click

    expect(current_path).to eq(/trips)
  end
end
