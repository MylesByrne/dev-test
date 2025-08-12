require 'rails_helper'

RSpec.describe "Cars", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "Creating a Car" do
    let!(:bmw) { Make.create!(name: "BMW") }
    let!(:audi) { Make.create!(name: "Audi") }
    let!(:bmw_3series) { CarModel.create!(name: "3 Series", make: bmw) }
    let!(:audi_s3) { CarModel.create!(name: "S3", make: audi) }
    let!(:bmw_year)  { Year.create!(year: 2022, make: bmw,  car_model: bmw_3series) }
    let!(:audi_year) { Year.create!(year: 2019, make: audi, car_model: audi_s3) }


    context "when successful" do
      it "creates a new Car record" do
        visit new_car_path
        
        # Select Make and verify Model options
        find("#car_make_select").select("BMW")
        expect(page).to have_select("car_model_select", with_options: ["3 Series"])
        expect(page).not_to have_select("car_model_select", with_options: ["S3"])
        
        # Select Model and verify Year options
        find("#car_model_select").select("3 Series")
        expect(page).to have_select("car_year_select", with_options: ["2022"])
        expect(page).not_to have_select("car_year_select", with_options: ["2019"])
        
        # Select Year
        find("#car_year_select").select("2022")
        
        # Submit form
        click_button "Create Car"

        # Verify success
        expect(page).to have_content("Car was successfully created")
        
        # Verify database
        created_car = Car.last
        expect(created_car.year.year).to eq 2022
        expect(created_car.year.car_model).to eq bmw_3series
      end
    end

    context "when unsuccessful" do
      it "shows validation errors" do
        visit new_car_path
        
        # Only select make, leave other fields empty
        find("#car_make_select").select("BMW")
        click_button "Create Car"

        # Verify error messages
        expect(page).to have_content("Model can't be blank")
        expect(page).to have_content("Year can't be blank")
        
        # Verify no record was created
        expect(Car.count).to eq 0
      end
    end

    context "dependent dropdowns" do
      it "shows only valid combinations of Make/Model/Year" do
        visit new_car_path

        # Select BMW make
        find("#car_make_select").select("BMW")
        
        # Verify only BMW models shown
        expect(page).to have_select("car_model_select", with_options: ["3 Series"])
        expect(page).not_to have_select("car_model_select", with_options: ["S3"])

        # Select 3 Series model
        find("#car_model_select").select("3 Series")
        
        # Verify only valid years shown
        expect(page).to have_select("car_year_select", with_options: ["2022"])
        expect(page).not_to have_select("car_year_select", with_options: ["2019"])
      end
    end
  end
end
