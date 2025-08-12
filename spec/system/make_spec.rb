require "rails_helper"

RSpec.describe "Make", type: :system do
  it "creates a Make successfully", js: false do
    visit new_make_path
    fill_in "Name", with: "BMW"
    click_button "Create Make"
    expect(page).to have_content("Make was successfully created").or have_content("Makes")
    expect(Make.where(name: "BMW")).to exist
  end

  it "shows error when name blank", js: false do
    visit new_make_path
    click_button "Create Make"
    expect(page).to have_content("Name can't be blank")
  end
end
