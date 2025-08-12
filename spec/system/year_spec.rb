require 'rails_helper'

RSpec.describe "Years", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "Creating a Year" do
    let!(:make) { Make.create!(name: "BMW") }
    let!(:model) { CarModel.create!(name: "3 Series", make: make) }

    context "when successful" do
      it "creates a new Year record" do
        visit new_year_path
        
        # Select Make from dropdown
        find("#year_make_select").select("BMW")
        
        # Wait for and select Model from dependent dropdown
        expect(page).to have_select("year_model_select", with_options: ["3 Series"])
        find("#year_model_select").select("3 Series")
        
        # Enter year
        fill_in "Year", with: "2001"
        
        # Submit form
        click_button "Create Year"

        # Verify success
        expect(page).to have_content("Year was successfully created")
        
        # Verify database
        created_year = Year.last
        expect(created_year.year).to eq 2001
        expect(created_year.car_model).to eq model
      end
    end

    context "when unsuccessful" do
      it "shows validation errors" do
        visit new_year_path
        
        # Only select make, leave other fields empty
        find("#year_make_select").select("BMW")
        click_button "Create Year"

        # Verify error messages
        expect(page).to have_content("Year can't be blank")
        expect(page).to have_content("Model can't be blank")
        
        # Verify no record was created
        expect(Year.count).to eq 0
      end
    end
  end
end
