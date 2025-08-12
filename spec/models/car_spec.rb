# spec/models/car_spec.rb
require "rails_helper"

RSpec.describe Car, type: :model do
  it "requires coherent make/model/year relationship" do
    bmw  = create(:make, name: "BMW")
    audi = create(:make, name: "Audi")
    m3   = create(:car_model, name: "3 Series", make: bmw)
    y22  = create(:year, year: 2022, make: bmw, car_model: m3)

    car = Car.new(make: bmw, car_model: create(:car_model, name: "S3", make: audi), year: y22)
    expect(car).not_to be_valid
  end
end
