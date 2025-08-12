# spec/models/year_spec.rb
require "rails_helper"

RSpec.describe Year, type: :model do
  it "requires year, make, model" do
    y = Year.new
    expect(y).not_to be_valid
    expect(y.errors[:year]).to be_present
  end

  it "ensures model belongs to selected make" do
    bmw  = create(:make, name: "BMW")
    audi = create(:make, name: "Audi")
    m3   = create(:car_model, name: "3 Series", make: bmw)
    y    = Year.new(year: 2001, make: audi, car_model: m3)
    expect(y).not_to be_valid
  end
end
