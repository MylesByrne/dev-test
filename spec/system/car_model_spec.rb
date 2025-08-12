require "rails_helper"

RSpec.describe "Model", type: :system do
  it "creates a Model for a Make", js: false do
    create(:make, name: "BMW")
    visit new_car_model_path
    select "BMW", from: "Make"
    fill_in "Name", with: "3 Series"
    click_button "Create Model"
    expect(page).to have_content("Model was successfully created").or have_content("Models")
  end

  it "errors when name blank", js: false do
    create(:make, name: "BMW")
    visit new_car_model_path
    select "BMW", from: "Make"
    click_button "Create Model"
    expect(page).to have_content("Name can't be blank")
  end
end
